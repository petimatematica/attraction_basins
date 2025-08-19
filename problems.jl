function problemI()
    # Região retangular sugerida do problema I
    # interval_x = (-2.0,2.0)
    # interval_y = (-2.0,2.0)

    # Problema I
    f(z)=z^3-1 # função complexa que desejamos encontrar seus zeros
    df(z)=3z^2 # derivada da função acima

    # Soluções exatas do Problema I
    r1 = 1.0 + 0.0im;
    r2 = -0.5 + sqrt(3)/2.0im;
    r3 = -0.5 - sqrt(3)/2.0im;

    R=[r1;r2;r3] # Vetor com as soluções exatas do Problema I

    return f,df,R
end

function problemII()
    # Região retangular sugerida do problema II
    # interval_x = (-2.0,2.0)
    # interval_y = (-2.0,2.0)

    # Problema II
    f(z)=z^5+1 # função complexa que desejamos encontrar seus zeros
    df(z)=5z^4 # derivada da função acima

    # Soluções exatas do Problema II
    r1 = -1.0 +0.0im
    r2 = cos(pi/5)+sin(pi/5)im
    r3 = cos(3pi/5)+sin(3pi/5)im
    r4 = cos(7pi/5)+sin(7pi/5)im
    r5 = cos(9pi/5)+sin(9pi/5)im

    R=[r1;r2;r3;r4;r5] # Vetor com as soluções exatas do Problema II

    return f,df,R
end

function problemIII()
    # Região retangular sugerida do problema III
    # interval_x = (-5.0,5.0)
    # interval_y = (-5.0,5.0)

    # Problema III
    a = 0.4
    f(z)=(z-1)*(z+1)*(z^2+a^2) # função complexa que desejamos encontrar seus zeros
    df(z)=(z+1)*(z^2+a^2)+(z-1)*(z^2+a^2)+2z*(z-1)*(z+1) # derivada da função acima

    # Soluções exatas do Problema III
    r1 = 1.0 +0.0im
    r2 = -1.0 +0.0im
    r3 = -0.4im # -a im
    r4 = 0.4im # a im

    R=[r1;r2;r3;r4] # Vetor com as soluções exatas do Problema III

    return f,df,R
end