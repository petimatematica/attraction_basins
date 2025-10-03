using Images # salvar imagens e acesso ao sistema de cores RGB
include("newton.jl") # incluindo o método de Newton

# Gerar uma versão clara e uma versão escura de cores base
#----------------------------------------------------------------------------------------------
#= 
Variável obrigatória:
- n (Int64) - número de cores base a gerar

Variáveis opcionais:
- l_min (Int64) - valor mínimo de luminosidade (valores possíveis: 0 a 100) (padrão 60)
- l_max (Int64) - valor máximo de luminosidade (valores possíveis: 0 a 100) (padrão 75)
- c_min (Int64) - valor mínimo de saturação (valores possíveis: 0 a 100) (padrão 80)
- c_max (Int64) - valor máximo de saturação (valores possíveis: 0 a 100) (padrão 100)
- h_min (Int64) - valor mínimo do matiz (pesquise sobre círculo cromático) (valores possíveis de ângulo: 0 a 360) (padrão 0)
- h_max (Int64) - valor máximo do matiz (pesquise sobre círculo cromático) (valores possíveis de ângulo: 0 a 360) (padrão 360)
=#
#----------------------------------------------------------------------------------------------

function generate_color_pairs(n::Int;l_min=60,l_max=75,c_min=60,c_max=75,h_min=0,h_max=360)
    # Gerar n cores base, com luminosidade média e croma alto para serem bem vivas.
    base_colors = distinguishable_colors(n, 
                                         [RGB(1,1,1), RGB(0,0,0)], # Cores a evitar
                                         dropseed=true, 
                                         lchoices=l_min:l_max, # Luminosidade
                                         cchoices=c_min:c_max, # Saturação
										 hchoices=h_min:h_max) # Matiz 

    dark_colors = RGB{Float64}[] # vetor que armazenará a versão escura das cores base
    light_colors = RGB{Float64}[] # vetor que armazenará a versão clara das cores base

    # Para cada cor base, criar uma versão escura e uma clara
    for color in base_colors
        # Converter para o espaço de cores LCHab para manipular a luminosidade
        lch_color = convert(LCHab, color)

        # Criar a cor escura (L=0) e a clara (L=0), mantendo o croma e o matiz
        dark_lch = LCHab(0, lch_color.c, lch_color.h)
        light_lch = LCHab(100, lch_color.c, lch_color.h)

        # Converter de volta para RGB e adicionar aos vetores
        push!(dark_colors, convert(RGB, dark_lch))
        push!(light_colors, convert(RGB, light_lch))
    end

    return dark_colors, light_colors
end

# n_x - número de células homogêneas da partição de interval_x
# n_y - número de células homogêneas da partição de interval_x
# R - vetor contendo todos os zeros da função f
# l - parâmetro positivo que aumenta a luminosidade da imagem gerada


# Criar uma imagem das bacias de atração geradas pelo Método de Newton
#----------------------------------------------------------------------------------------------
#= 
Variáveis obrigatória:
- f (Function) - função complexa holomorfa que desejamos mapear as bacias de atração
- df (Function) - derivada de f
- interval_x, interval_y (Vector{Float64}) - intervalos onde seu produto cartesiano gera uma região retangular que contém todos os zeros
- n_x (Int64) - número de células homogêneas da partição de interval_x
- n_y (Int64) - número de células homogêneas da partição de interval_y
- R (Vector{ComplexF64}) - vetor contendo todos os zeros da função f

Variáveis opcionais:
- epsilon (Float64) - tolerância prescrita ao Método de Newton
- iter (Int64) - número máximo de iteradas
- factor (Float64) - altera a tolerância do teste do erro absoluto
- l (Float64) - altera a luminosidade da imagem
- l_m (Int64) - valor mínimo de luminosidade (valores possíveis: 0 a 100) (padrão 60)
- l_M (Int64) - valor máximo de luminosidade (valores possíveis: 0 a 100) (padrão 75)
- c_m (Int64) - valor mínimo de saturação (valores possíveis: 0 a 100) (padrão 80)
- c_M (Int64) - valor máximo de saturação (valores possíveis: 0 a 100) (padrão 100)
- h_m (Int64) - valor mínimo do matiz (pesquise sobre círculo cromático) (valores possíveis de ângulo: 0 a 360) (padrão 0)
- h_M (Int64) - valor máximo do matiz (pesquise sobre círculo cromático) (valores possíveis de ângulo: 0 a 360) (padrão 360)
=#
#----------------------------------------------------------------------------------------------
function image_generator(f,df,interval_x, interval_y, n_x, n_y, R; epsilon=1.e-12, iter = 40, factor=10, l=0, l_m=60, l_M=75, c_m=60, c_M=75, h_m=0, h_M=360)
	imagem = Matrix{RGB{Float64}}(undef,n_y,n_x) # cria uma imagem de resolução n_y por n_x 

    # aquisição de cores
    n=length(R) # n é o número de zeros de f
    dark_colors, light_colors = generate_color_pairs(n,l_min=l_m,l_max=l_M,c_min=c_m,c_max=c_M,h_min=h_m,h_max=h_M)
        
    # Criar partições para os dois intervalos
    x_points = range(interval_x[1], interval_x[2], length=n_x)
    y_points = range(interval_y[1], interval_y[2], length=n_y)

	for lin in n_y:-1:1
	    for col in 1:n_x
	        z0 = x_points[col]+y_points[lin]*im # Gerando o chute
		    s,iters = newton_method(z0, f, df;tol=epsilon,max_iter=iter)
		    etol = epsilon*factor
			
			if ~isnan(s)
            	for k in 1:n 
                	if abs(s-R[k])<etol # teste do erro absoluto
                		
			    		mult1=iters-1
			    		mult2=iter-1
			    		mult=mult1/mult2 # fator utilizado para que as tonalidades dependam do número de iteradas
			    		
			    		# extraindo as coordenadas RGB da cor escura
			    		d_r=dark_colors[k].r
			    		d_g=dark_colors[k].g
			    		d_b=dark_colors[k].b
			    		
			    		# extraindo as coordenadas RGB da cor clara
			    		l_r=light_colors[k].r
			    		l_g=light_colors[k].g
			    		l_b=light_colors[k].b
			    		
			    		# salvaguardando valores fora do intervalo [0,1]
			    		r = max(0,min(1,l_r+(d_r-l_r-l/255)*mult)) # componente vermelha
			    		g = max(0,min(1,l_g+(d_g-l_g-l/255)*mult)) # componente verde
			    		b = max(0,min(1,l_b+(d_b-l_b-l/255)*mult)) # componente azul
			    		
               			imagem[n_y-lin+1,col]=RGB(r,g,b) # pinta o pixel na cor correspondente
                        break
                    end
                end
            else
				if iters == -1 # derivada em módulo muito pequena
                	imagem[n_y-lin+1,col] = RGB(1.0,1.0,1.0) # pinta o pixel de branco
            	end
            	if iters == -2 # o número de iteradas excedeu o número máximo de iteradas
                	imagem[n_y-lin+1,col] = RGB(0.0,0.0,0.0) # pinta o pixel de preto
            	end
            end
 	    end	
	end
	     
	return imagem
	
end

# Criar uma imagem das bacias de atração geradas pelo Método de Newton sem considerar o número de iteradas
function image_generator_off(f,df,interval_x, interval_y, n_x, n_y, R; epsilon=1.e-12, iter = 40, factor=10, l_m=60, l_M=75, c_m=60, c_M=75, h_m=0, h_M=360)
	imagem = Matrix{RGB{Float64}}(undef,n_y,n_x) # cria uma imagem de resolução n_y por n_x 

    # aquisição de cores
    n=length(R) # n é o número de zeros de f
     base_colors = distinguishable_colors(n, 
                                         [RGB(1,1,1), RGB(0,0,0), RGB(1,0,0)], # Cores a evitar
                                         dropseed=true, 
                                         lchoices=l_m:l_M, # Luminosidade
                                         cchoices=c_m:c_M, # Saturação
										 hchoices=h_m:h_M) # Matiz 
        
    # Criar partições para os dois intervalos
    x_points = range(interval_x[1], interval_x[2], length=n_x)
    y_points = range(interval_y[1], interval_y[2], length=n_y)

	for lin in n_y:-1:1
	    for col in 1:n_x
	        z0 = x_points[col]+y_points[lin]*im # Gerando o chute
		    s,iters = newton_method(z0, f, df;tol=epsilon,max_iter=iter)
		    etol = epsilon*factor
			
			if ~isnan(s)
            	for k in 1:n 
					delta_x = abs(interval_x[1]-interval_x[2])
					delta_y = abs(interval_x[1]-interval_x[2])
					if abs(z0-R[k])<min(delta_x*8.e-3,delta_y*8.e-3)
						imagem[n_y-lin+1,col] = RGB(1.0,0.0,0.0) # pinta o pixel de vermelho
						break
					else
						if abs(s-R[k])<etol # teste do erro absoluto
							imagem[n_y-lin+1,col] = base_colors[k]
							break
						end
					end
                end
            else
				if iters == -1 # derivada em módulo muito pequena
                	imagem[n_y-lin+1,col] = RGB(1.0,1.0,1.0) # pinta o pixel de branco
            	end
            	if iters == -2 # o número de iteradas excedeu o número máximo de iteradas
                	imagem[n_y-lin+1,col] = RGB(0.0,0.0,0.0) # pinta o pixel de preto
            	end
            end
 	    end	
	end
	     
	return imagem
	
end
