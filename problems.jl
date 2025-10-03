function problem_roots_of_one(n::int)
	f(z)=z^n-1 			# função complexa
	df(z)=n*z^(n-1) 	# derivada da função complexa acima
	
	# Soluções exatas do problema f(z)=0
	R = [cos(2*π*k/n) + sin(2*π*k/n)im for k in 0:n-1]
	
	return f,df,R
end

function problem_roots_of_minus_one(n::int) 
	f(z)=z^n+1 			# função complexa
	df(z)=n*z^(n-1) 	# derivada da função complexa acima
	
	# Soluções exatas do problema f(z)=0
	R = [-cos(2*π*k/n) - sin(2*π*k/n)im for k in 0:n-1]
	
	return f,df,R
end

function problemI()
    f(z)=z^3-1 # função complexa
    df(z)=3z^2 # derivada da função complexa acima

    # Soluções exatas do problema f(z)=0
    r1 = 1.0 + 0.0im;
    r2 = -0.5 + sqrt(3)/2.0im;
    r3 = -0.5 - sqrt(3)/2.0im;

    R=[r1;r2;r3] # Vetor com as soluções exatas do problema

    return f,df,R
end

function problemII()
    f(z)=z^5+1 # função complexa
    df(z)=5z^4 # derivada da função complexa acima

    # Soluções exatas do problema f(z)=0
    r1 = -1.0 +0.0im
    r2 = cos(pi/5)+sin(pi/5)im
    r3 = cos(3pi/5)+sin(3pi/5)im
    r4 = cos(7pi/5)+sin(7pi/5)im
    r5 = cos(9pi/5)+sin(9pi/5)im

    R=[r1;r2;r3;r4;r5] # Vetor com as soluções exatas do problema

    return f,df,R
end

function problemIII()
    a = 0.4
    f(z)=(z-1)*(z+1)*(z^2+a^2) # função complexa
    df(z)=(z+1)*(z^2+a^2)+(z-1)*(z^2+a^2)+2z*(z-1)*(z+1) # derivada da função complexa acima

    # Soluções exatas do problema f(z)=0
    r1 = 1.0 +0.0im
    r2 = -1.0 +0.0im
    r3 = -0.4im # -a im
    r4 = 0.4im # a im

    R=[r1;r2;r3;r4] # Vetor com as soluções exatas do problema

    return f,df,R
end

function problemIV()
    f(z) = -z^3 - 2*z^2 - 3*z - 2 # função complexa
    df(z) = -3*z^2 - 4*z - 3 # derivada da função complexa acima

	# Soluções exatas do problema f(z)=0
    r1 = -1.0 + 0.0im
    r2 = -0.5 + 1.32287565553im
    r3 = -0.5 - 1.32287565553im

	# Vetor com as soluções exatas do problema
    R=[r1;r2;r3]

    return f,df,R
end

function problemV(k1, k2, k3, a, b, c)
    f(z) = (z-k1)^a * (z-k2)^b * (z-k3)^c # função complexa

	# Parcelas da derivada
    term1(z) = a * (z - k1)^(a - 1) * (z - k2)^b * (z - k3)^c
    term2(z) = b * (z - k1)^a * (z - k2)^(b - 1) * (z - k3)^c
    term3(z) = c * (z - k1)^a * (z - k2)^b * (z - k3)^(c - 1)
	
    df(z) = term1(z) + term2(z) + term3(z)# derivada da função complexa acima

    R=[k1;k2;k3]

    return f, df, R
end
