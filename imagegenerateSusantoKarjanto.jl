using Images # salvar imagens e acesso ao sistema de cores RGB
using ColorSchemes # Criação de gradientes e acesso a esquema de cores predefinidas
include("newton.jl") # incluindo o método de Newton 

# cria uma imagem das bacias de atração geradas pelo Método de Newton baseando-se no número de iteradas utilizando a metodologia de 
#  H. Susanto, N. Karjanto, Newton’s method basin of attraction revisited, Appl. Math. Comput. 215 (2009) 1084–1090.
#----------------------------------------------------------------------------------------------
#= 
Variáveis obrigatória:
- f (Function) - função complexa holomorfa que desejamos mapear as bacias de atração
- df (Function) - derivada de f
- interval_x, interval_y (Vector{Float64}) - intervalos onde seu produto cartesiano gera uma região retangular que contém todos os zeros
- n_x (Int64) - número de células homogêneas da partição de interval_x
- n_y (Int64) - número de células homogêneas da partição de interval_y

Variáveis opcionais:
- epsilon (Float64) - tolerância prescrita ao Método de Newton (padrão 10^{-12})
- iter (Int64) - número máximo de iteradas (padrão 40 iteradas)
=#
#----------------------------------------------------------------------------------------------

function image_generator_iter(f,df,interval_x, interval_y, n_x, n_y; epsilon=1.e-12, iter=40)
    imagem = Matrix{RGB{Float64}}(undef,n_y,n_x) # cria uma imagem de resolução n_y por n_x  
    for i in 1:n_y
        for j in 1:n_x
            imagem[i,j]=RGB(1.0,1.0,1.0)
        end
    end

    # aquisição de cores
    colors= cgrad([:darkblue,:cyan,:yellow,:orange,:red,:red4],[.0, .26, .5, .6, .7, 1])
    m=length(colors.colors)
    
    # Criar partições para os dois intervalos
    x_points = range(interval_x[1], interval_x[2], length=n_x)
    y_points = range(interval_y[1], interval_y[2], length=n_y)

	for lin in n_y:-1:1
	    for col in 1:n_x
	        z0 = x_points[col]+y_points[lin]*im # Gerando o chute
		    s,iters = newton_method(z0, f, df;tol=epsilon,max_iter=iter)
			
			if ~isnan(s)
            	imagem[n_y-lin+1,col] = colors[iters/iter]  # pinta o pixel na cor correspondente
        	else
            	if iters == -1
                	imagem[n_y-lin+1,col] = RGB(0.0,0.0,0.0)
           		end
            	if iters == -2
                	imagem[n_y-lin+1,col] = colors[m]
            	end
        	end
 	    end	
	end
	     
	return imagem

end
