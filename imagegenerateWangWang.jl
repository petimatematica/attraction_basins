using Images # salvar imagens e acesso ao sistema de cores RGB
include("newton.jl") # incluindo os arquivos necessários 

# f - holomorphic function which we want to find its zeros
# df - complex derivative of f
# interval_x, interval_y - intervals which its cartesian product generates the rectangular region desired that contains all the zeros of the complex function f
# n_x - number of homogenuous cells of the partition of interval_x
# n_y - number of homogenuous cells of the partition of interval_y
# R - vector with all the zeros of f

function image_generator(f,df,interval_x, interval_y, n_x, n_y, R; epsilon=1.e-5, iter = 20, factor=1.e+3)
	imagem = Matrix{RGB{Float64}}(undef,n_y,n_x) # create a image with resolution of n_y by n_x 
    Iter = Matrix{Int64}(undef,n_y,n_x) # create a vector with n_y by n_x entries which we will to store the number of iterates
	
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
			       			imagem[n_y-lin+1,col]=RGB((114+(249-114)*mult)/255,(43+(222-43)*mult)/255,(18+(213-18)*mult)/255)
			    		end
			    		if k == 1 # verde
							imagem[n_y-lin+1,col]=RGB((22+(217-22)*mult)/255,(83+(247-83)*mult)/255,(17+(215-17)*mult)/255)
			    		end
			    		if k == 3 # azul
							imagem[n_y-lin+1,col]=RGB((110+(255-110)*mult)/255,(110+(255-110)*mult)/255,125*mult/255)
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
