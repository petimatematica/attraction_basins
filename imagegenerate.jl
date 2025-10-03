using Images # salvar imagens e acesso ao sistema de cores RGB
include("newton.jl") # incluindo o método de Newton

function generate_color_pairs(n::Int)
    # Gerar n cores base, com luminosidade média e croma alto para serem bem vivas.
    base_colors = distinguishable_colors(n, 
                                         [RGB(1,1,1), RGB(0,0,0)], # Cores a evitar
                                         dropseed=true, 
                                         lchoices=60:75, # Luminosidade
                                         cchoices=80:100) # Saturação

    dark_colors = RGB{Float64}[] # vetor
    light_colors = RGB{Float64}[]

    # Para cada cor base, criar uma versão escura e uma clara.
    for color in base_colors
        # Converter para LCHab para manipular a luminosidade facilmente
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


# f - função holomorfa que desejamos encontrar seus zeros
# df - derivada complexa de f
# interval_x, interval_y - intervalos onde seu produto cartesiano gera um região retangular que contém todos os zeros
# n_x - número de células homogêneas da partição de interval_x
# n_y - número de células homogêneas da partição de interval_x
# R - vetor contendo todos os zeros da função f
# l - parâmetro positivo que aumenta a luminosidade da imagem gerada

function image_generator(f,df,interval_x, interval_y, n_x, n_y, R; epsilon=1.e-12, iter = 40, factor=10, l=0)
	imagem = Matrix{RGB{Float64}}(undef,n_y,n_x) # cria uma imagem de resolução n_y por n_x 
    Iter = Matrix{Int64}(undef,n_y,n_x) # cria um vetor com n_y por n_x entradas que armazenarão o número de iteradas

    # aquisição de cores
    n=length(R) # n é o número de zeros de f
    dark_colors, light_colors = generate_color_pairs(n)
        
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
                	if abs(s-R[k])<etol
                		
                		# fator RGB
			    		mult1=iters-1
			    		mult2=iter-1
			    		mult=mult1/mult2
			    		
			    		# extraindo as coordenadas RGB da cor escura
			    		d_r=dark_colors[k].r
			    		d_g=dark_colors[k].g
			    		d_b=dark_colors[k].b
			    		
			    		# extraindo as coordenadas RGB da cor clara
			    		l_r=light_colors[k].r
			    		l_g=light_colors[k].g
			    		l_b=light_colors[k].b
			    		
			    		# salvaguardando valores fora do intervalo [0,1]
			    		r = max(0,min(1,d_r+(l_r-d_r+l/255)*mult)) # componente vermelha
			    		g = max(0,min(1,d_g+(l_g-d_g+l/255)*mult)) # componente verde
			    		b = max(0,min(1,d_b+(l_b-d_b+l/255)*mult)) # componente azul
			    		
               			imagem[n_y-lin+1,col]=RGB(r,g,b) # pinta o pixel na cor correspondente
               			Iter[n_y-lin+1,col] = iters # armazena o número de iteradas
                        break
                    end
                end
            else
            	if iters == -2 # o número de iteradas excedeu o número máximo de iteradas
                	imagem[n_y-lin+1,col] = RGB(1.0,1.0,1.0) # pinta o pixel de branco
                	Iter[n_y-lin+1,col] = iters # armazena o número de iteradas
            	end
            end
 	    end	
	end
	     
	return imagem, Iter
	
end
