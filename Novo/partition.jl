# Método para particionar uma região retangular

function partition_rectangle(interval_x, interval_y, n_x, n_y)
    
    # Criar partições para os dois intervalos
    x_points = range(interval_x[1], interval_x[2], length=n_x)
    y_points = range(interval_y[1], interval_y[2], length=n_y)
    
    # Gerar o vetor dos chutes
    coordinates = [x_points[i]+y_points[j]*im for j in n_y:-1:1 for i in 1:n_x]

    return coordinates

end
