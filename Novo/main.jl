include("imagegenerate.jl"); include("problems.jl")

# Região retangular do problema
interval_x = (-2.0,2.0)
interval_y = (-2.0,2.0)

# Número de subdivisões dos problema
n_x = 3000
n_y = 3000

f,df,R=problemX()

imagem, iter, colors = image_generator(f,df,interval_x, interval_y, n_x, n_y, R)
save("teste.png", colorview(RGB, imagem))
