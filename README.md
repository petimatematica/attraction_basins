# main.jl
Este arquivo inclui os arquivos necessários, invoca uma função que gera a matriz de cores RGB e a função que cria uma imagem baseando-se na matriz gerada, sendo a imagem salva em png com o nome desejado pelo usuário.

## Exemplo
Suponha que desejamos gerar uma imagem que represente as bacias de atração da função complexa holomorfa 

$$
f(z)=z^3-1.
$$

Para que possamos invocar as funções que geram a imagem que representa as bacias de atração do Método de Newton para a referida equação, precisamos de sua derivada, seus zeros, uma região retangular que contenha esses zeros e a resolução desejada. Neste caso, $$f'(z)=3z^2$$ (derivada de $$f$$), $z_1=1$, 
$z_2=-\frac{1}{2}+i\frac{\sqrt{3}}{2}$, $z_2=-\frac{1}{2}-i\frac{\sqrt{3}}{2}$ (zeros de $f$) e $\Omega=[-3.84,3.84]\times[-2.16,2.16]$ (Região retangular). Considere que gostaríamos de uma imagem com resolução HD, isto é 1280 x 720 pixels. Com essas informações, temos

```julia
include("imagegenerate.jl") # incluindo arquivos necessários

# Região retangular
interval_x = [-3.84,3.84]
interval_y = [-2.16,2.16]

# Número de subdivisões
n_x = 1280; n_y = 720 

# Função, derivada e zeros
f(z)=z^3-1
f'(z)=3*z^2
Z=[1.0+0.0im;-1/2+sqrt(3)/2im;-1/2-sqrt(3)/2im]

imagem = image_generator(f,df,interval_x, interval_y, n_x, n_y, Z; epsilon=1.e-12, iter = 40, factor=10, l=100)
save("TesteI.png", colorview(RGB, imagem)) # salva uma imagem no formato png com o nome dado na String
```

O código em Julia acima, gera a seguinte imagem
![Alt text](https://github.com/petimatematica/attraction_basins/blob/main/Fractais/TesteI.png)

# imagegenerate.jl
Este arquivo contém a implementação de um programa que cria uma imagem das bacias de atração geradas pelo Método de Newton com ou sem contribuição do número de iteradas baseando-se nos zeros da função.

# imagegenerateSusantoKarjanto.jl
Este arquivo contém a implementação de um programa que cria uma imagem das bacias de atração geradas pelo Método de Newton baseando-se no número de iteradas utilizando a metodologia de [1]. 

# imagegenerateWangWang.jl
Este arquivo contém a implementação de um programa que cria uma imagem das bacias de atração geradas pelo Método de Newton baseando-se nos zeros da função utilizando a metodologia de [2].

# newton.jl
Este arquivo contém uma implementação do Método de Newton puro empregado no problema de encontrar zero de funções complexas holomorfas

# problems.jl
Seleção de alguns problemas testados durante o desenvolvimento das implementações.

# Referências
[1] H. Susanto, N. Karjanto, Newton’s method basin of attraction revisited, Appl. Math. Comput. 215 (2009) 1084–1090.   
[2] Wang X. Y., Wang T. T., (2007), “Julia Sets of Generalized Newton’s Method”, Fractal, vol. 15, no. 4, pp. 323–336.  
