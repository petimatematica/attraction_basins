using Plots,FileIO,ColorSchemes,Images # Carregando os pacotes necessários
include("partition.jl"); include("newton.jl") # incluindo os arquivos suporte

# interval_x, interval_y - intervalos cujo produto cartesiano gera a região retangular desejada, ou seja, que contém todos os zeros da função complexa f
# n_x - número de células homogêneas ao particionar interval_x
# n_y - número de células homogêneas ao particionar interval_x
# R - vetor que contém todos os zeros da função complexa f
function image_generator(f,df,interval_x, interval_y, n_x, n_y, R, L)
    imagem = Matrix{RGB{Float64}}(undef,n_y,n_x)
    Iter = Matrix{Int64}(undef,n_y,n_x)

    # Índices de Linha e Coluna
    global lin = 0
    global col = 0

    # Obtenção das cores
    n=length(R)
    colors = cgrad(:lighttest,n,categorical=true)

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
        end
    end
    
    return imagem, Iter, colors

end
