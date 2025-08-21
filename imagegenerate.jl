using Plots,FileIO,ColorSchemes,Images # loading the necessary packages
include("partition.jl"); include("newton.jl") # including the necessary files 

# f - holomorphic function which we want to find its zeros
# df - complex derivative of f
# interval_x, interval_y - intervals which its cartesian product generates the rectangular region desired that contains all the zeros of the complex function f
# n_x - number of homogenuous cells of the partition of interval_x
# n_y - number of homogenuous cells of the partition of interval_y
# R - vector with all the zeros of f
# L - "light-intensity functions" is a monotonic real valued function limited in (0,1] that weights the RGB color in each pixel based on number of iterates
function image_generator(f,df,interval_x, interval_y, n_x, n_y, R, L)
    imagem = Matrix{RGB{Float64}}(undef,n_y,n_x) # create a image with resolution of n_y by n_x 
    Iter = Matrix{Int64}(undef,n_y,n_x) # create a vector with n_y by n_x entries which we will to store the number of iterates
    for i in 1:n_y
        for j in 1:n_x
            imagem[i,j]=RGB(1.0,1.0,1.0)
        end
    end

    # row and column indexes
    global lin = 0
    global col = 0

    # color acquisition
    n=length(R) # n is the number of the zeros of f
    color = cgrad([:seagreen,:royalblue4,:magenta3,:crimson,:darkorange2])
    colors = cgrad(color,n,categorical=true) # this guarantees that each zero has its own color

    # Obtenção dos chutes
    chutes = partition_rectangle(interval_x, interval_y, n_x, n_y)

    for i in 1:size(chutes,1)

        global z0 = chutes[i]
        
        s,iters = newton_method(z0, f, df)

        if i % n_x == 1
                global col = 1
                global lin += 1
            else
                global col += 1
            end
        etol = 1.e-12
        
        if ~isnan(s)
            for k in 1:n 
                if abs(s-R[k])<etol
                    L_i=L(iters)
                    imagem[lin,col] = L_i*colors[k]
                    Iter[lin,col] = iters
                end
            end
        else
            imagem[lin,col] = RGB(0.0,0.0,0.0)
            Iter[lin,col] = iters
        end
    end
    
    return imagem, Iter, colors

end






