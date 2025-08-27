using Plots,FileIO,ColorSchemes,Images,Colors # loading the necessary packages
include("partition.jl"); include("newton.jl") # including the necessary files 

# f - holomorphic function which we want to find its zeros
# df - complex derivative of f
# interval_x, interval_y - intervals which its cartesian product generates the rectangular region desired that contains all the zeros of the complex function f
# n_x - number of homogenuous cells of the partition of interval_x
# n_y - number of homogenuous cells of the partition of interval_y
# R - vector with all the zeros of f
function image_generator(f,df,interval_x, interval_y, n_x, n_y, R; epsilon=1.e-12, iter = 40, factor=10)
    imagem = Matrix{RGB{Float64}}(undef,n_y,n_x) # create a image with resolution of n_y by n_x 
    Iter = Matrix{Int64}(undef,n_y,n_x) # create a vector with n_y by n_x entries which we will to store the number of iterates

    # row and column indexes
    global lin = 0
    global col = 0

    # color acquisition
    n=length(R) # n is the number of the zeros of f
    colors = distinguishable_colors(n+1, [RGB(1,1,1), RGB(0,0,0)], dropseed=true, cchoices=20:30)
    palette = cgrad(colors)
    
    # Obtenção dos chutes
    chutes = partition_rectangle(interval_x, interval_y, n_x, n_y)

    for i in 1:size(chutes,1)

        global z0 = chutes[i]
        
        s,iters = newton_method(z0, f, df;tol=epsilon,max_iter=iter)

        if i % n_y == 1
                global col = 1
                global lin += 1
            else
                global col += 1
            end
        etol = epsilon*factor
        
        if ~isnan(s)
            for k in 1:n 
                if abs(s-R[k])<etol
                    imagem[lin,col] = palette[(k-1)/n*0.99+iters/(n*iter)]
                    Iter[lin,col] = iters
                    break
                end
            end
        else
            if iters == -2
                imagem[lin,col] = RGB(1.0,1.0,1.0)
                Iter[lin,col] = iters
            end
        end
    end
    
    return imagem, Iter

end
