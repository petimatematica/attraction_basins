include("imagegenerate.jl") # incluindo arquivos necessários

# Região retangular
interval_x = [-6.0,4.0]
interval_y = [-5.0,3.0]

# Número de subdivisões
n_x = 1000; n_y = 1000 

# Função, derivada e zeros
f=
df=
Z=

imagem, iter = image_generator_off(f,df,interval_x,interval_y,n_x,n_y,Z) # invocando a função que gera as imagens
save("TesteI.png", colorview(RGB, imagem)) # salva uma imagem no formato png com o nome dado na String
