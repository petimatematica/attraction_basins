using Plots,FileIO,ColorSchemes,Images # loading the necessary packages
include("newton.jl") # including the necessary files 

# f - holomorphic function which we want to find its zeros
# df - complex derivative of f
# interval_x, interval_y - intervals which its cartesian product generates the rectangular region desired that contains all the zeros of the complex function f
# n_x - number of homogenuous cells of the partition of interval_x
# n_y - number of homogenuous cells of the partition of interval_y
# R - vector with all the zeros of f
function image_generator_iter(f,df,interval_x, interval_y, n_x, n_y; epsilon=1.e-12, iter=40)
    imagem = Matrix{RGB{Float64}}(undef,n_y,n_x) # create a image with resolution of n_y by n_x 
    Iter = Matrix{Int64}(undef,n_y,n_x) # create a vector with n_y by n_x entries which we will to store the number of iterates
    for i in 1:n_y
        for j in 1:n_x
            imagem[i,j]=RGB(1.0,1.0,1.0)
        end
    end

    # color acquisition
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
            	imagem[n_y-lin+1,col] = colors[iters/iter]
            	Iter[n_y-lin+1] = iters
        	else
            	if iters == -1
                	imagem[n_y-lin+1,col] = RGB(0.0,0.0,0.0)
                	Iter[n_y-lin+1,col] = iters
           		end
            	if iters == -2
                	imagem[n_y-lin+1,col] = colors[m]
                	Iter[n_y-lin+1,col] = iters
            	end
        	end
 	    end	
	end
	     
	return imagem, Iter

end