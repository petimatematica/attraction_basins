function problem_roots_of_one(n) # the problem is to find the complex number z such that z^n=1
	f(z)=z^n-1 			# complex function that we wish to find its zeros
	df(z)=n*z^(n-1) 	# complex derivative of the function defined in the line above
	
	# Exact solutions of the proposed problem
	R = [cos(2*π*k/n) + sin(2*π*k/n)im for k in 0:n-1]
	
	return f,df,R
end

function problem_roots_of_minus_one(n) # the problem is to find the complex number z such that z^n=-1
	f(z)=z^n+1 			# complex function that we wish to find its zeros
	df(z)=n*z^(n-1) 	# complex derivative of the function defined in the line above
	
	# Exact solutions of the proposed problem
	R = [-cos(2*π*k/n) - sin(2*π*k/n)im for k in 0:n-1]
	
	return f,df,R
end

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

function problemIV()
    f(z) = -z^3 - 2*z^2 - 3*z - 2
    df(z) = -3*z^2 - 4*z - 3

    r1 = -1.0 + 0.0im
    r2 = -0.5 + 1.32287565553im
    r3 = -0.5 - 1.32287565553im

    R=[r1;r2;r3]

    return f,df,R
end

function problemV(k1, k2, k3, a, b, c)
    f(z) = (z-k1)^a * (z-k2)^b * (z-k3)^c
    term1(z) = a * (z - k1)^(a - 1) * (z - k2)^b * (z - k3)^c
    term2(z) = b * (z - k1)^a * (z - k2)^(b - 1) * (z - k3)^c
    term3(z) = c * (z - k1)^a * (z - k2)^b * (z - k3)^(c - 1)
    df(z) = term1(z) + term2(z) + term3(z)

    R=[k1;k2;k3]

    return f, df, R
end

function problemVI()
    f(z) = z^7 - 1.0
    df(z) = 7.0*z^6
    R = [cos(2*π*k/7.) + sin(2*π*k/7)im for k in 0:6]
    return f,df,R
end