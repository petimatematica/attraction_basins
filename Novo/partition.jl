# Método para particionar uma região retangular

function partition_rectangle(interval_x, interval_y, n_x, n_y)
    
    # Criar partições para os dois intervalos
    x_points = range(interval_x[1], interval_x[2], length=n_x)
    y_points = range(interval_y[1], interval_y[2], length=n_y)
    
    # Gerar o vetor dos chutes
    coordinates = [x_points[i]+y_points[j]*im for i in 1:n_x for j in 1:n_y]

    return coordinates

end

function test(n_x,n_y)
    lin = 0
    col = 0
    points = []
    for i in 1:n_x*n_y
        if i % n_x == 1
            col = 1
            lin += 1
        else
            col += 1
        end
        push!(points, [lin, col])
    end
    return points
end
