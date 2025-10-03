using Images # salvar imagens e acesso ao sistema de cores RGB
include("newton.jl") # incluindo os arquivos necessários 

# cria uma imagem das bacias de atração geradas pelo Método de Newton baseando-se no número de iteradas utilizando a metodologia de 
#  Wang X. Y., Wang T. T., (2007), “Julia Sets of Generalized Newton’s Method”, Fractal, vol. 15, no. 4, pp. 323–336.
#----------------------------------------------------------------------------------------------
#= 
Variáveis obrigatória:
- f (Function) - função complexa holomorfa que desejamos mapear as bacias de atração
- df (Function) - derivada de f
- interval_x, interval_y (Vector{Float64}) - intervalos onde seu produto cartesiano gera uma região retangular que contém todos os zeros
- n_x (Int64) - número de células homogêneas da partição de interval_x
- n_y (Int64) - número de células homogêneas da partição de interval_y
- R (Vector{ComplexF64}) - vetor contendo todos os zeros da função f
- factor (Float64) - altera a tolerância do teste do erro absoluto (padrão 10^3)

Variáveis opcionais:
- epsilon (Float64) - tolerância prescrita ao Método de Newton (padrão 10^{-5})
- iter (Int64) - número máximo de iteradas (padrão 20 iteradas)
=#
#----------------------------------------------------------------------------------------------

function image_generator(f,df,interval_x, interval_y, n_x, n_y, R; epsilon=1.e-5, iter = 20, factor=1.e+3)
	imagem = Matrix{RGB{Float64}}(undef,n_y,n_x) # cria uma imagem de resolução n_y por n_x 
	
    n=length(R) # n é o número de zeros de f
        
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
			    		mult1=iters-1
			    		mult2=iter-1
			    		mult=mult1/mult2
                        # imagem[lin,col] = palette[(k-1)/n*0.99+iters/(n*iter)]
			    		if k == 2 # vermelho
			       			imagem[n_y-lin+1,col]=RGB((114+(249-114)*mult)/255,(43+(222-43)*mult)/255,(18+(213-18)*mult)/255) # pinta o pixel na cor correspondente
			    		end
			    		if k == 1 # verde
							imagem[n_y-lin+1,col]=RGB((22+(217-22)*mult)/255,(83+(247-83)*mult)/255,(17+(215-17)*mult)/255) # pinta o pixel na cor correspondente
			    		end
			    		if k == 3 # azul
							imagem[n_y-lin+1,col]=RGB((110+(255-110)*mult)/255,(110+(255-110)*mult)/255,125*mult/255) # pinta o pixel na cor correspondente
			    		end
               			
               			Iter[n_y-lin+1,col] = iters
                        break
                    end
                end
            else
            	if iters == -2
                	imagem[n_y-lin+1,col] = RGB(1.0,1.0,1.0)
                	Iter[n_y-lin+1,col] = iters
            	end
            end
 	    end	
	end
	     
	return imagem, Iter
	
end
