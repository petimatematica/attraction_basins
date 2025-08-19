include("imagegenerate.jl"); include("problems.jl")

# Região retangular do problema
interval_x = (-2.0,2.0)
interval_y = (-2.0,2.0)

# Número de subdivisões dos problema
n_x = 3000
n_y = 3000

L(x;c=0.5)=c*x/(c*x+1) # Função itensidade de cor

f,df,R=problemI()

imagem, iter, colors = image_generator(f,df,interval_x, interval_y, n_x, n_y, R, L)
save("teste.png", colorview(RGB, imagem))