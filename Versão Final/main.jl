include("imagegenerate.jl"); include("problems.jl")

# Região retangular do problema
interval_x = (-6.0,4.0)
interval_y = (-5.0,3.0)

# Número de subdivisões dos problema
n_x = 1000; n_y = 800 # Resolução definitiva
# n_x = 1000; n_y = 1000 # Resolução teste

f,df,R=problemV(-1.0-2.0im,-2.0-1.0im,-0.634-0.634,1,1,1)

imagem, iter = image_generator(f,df,interval_x, interval_y, n_x, n_y,R,l=200)
save("TesteI.png", colorview(RGB, imagem))