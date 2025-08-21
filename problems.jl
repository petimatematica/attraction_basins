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
    f(z)=z^10 + 1
    df(z)=10*(z^9)

    r1 = cos(pi/10) + sin(pi/10)im
    r2 = cos(3pi/10) + sin(3pi/10)im
    r3 = 0.0 + 1.0im
    r4 = cos(7pi/10) + sin(7pi/10)im
    r5 = cos(9pi/10) + sin(9pi/10)im
    r6 = cos(11pi/10) + sin(11pi/10)im
    r7 = cos(13pi/10) + sin(13pi/10)im
    r8 = 0.0 - 1.0im
    r9 = cos(17pi/10) + sin(17pi/10)im
    r10 = cos(19pi/10) + sin(19pi/10)im

    R=[r1;r2;r3;r4;r5;r6;r7;r8;r9;r10]

    return f,df,R
end

function problemV()
    f(z)=z^20 - 1
    df(z)=20*(z^19)

    r1 = 1.0 + 0.0im
    r2 = cos(pi/10) + sin(pi/10)im
    r3 = cos(2pi/10) + sin(2pi/10)im
    r4 = cos(3pi/10) + sin(3pi/10)im
    r5 = cos(4pi/10) + sin(4pi/10)im
    r6 = cos(5pi/10) + sin(5pi/10)im
    r7 = cos(6pi/10) + sin(6pi/10)im
    r8 = cos(7pi/10) + sin(7pi/10)im
    r9 = cos(8pi/10) + sin(8pi/10)im
    r10 = cos(9pi/10) + sin(9pi/10)im
    r11 = -1.0 + 0.0im
    r12 = cos(11pi/10) + sin(11pi/10)im
    r13 = cos(12pi/10) + sin(12pi/10)im
    r14 = cos(13pi/10) + sin(13pi/10)im
    r15 = cos(14pi/10) + sin(14pi/10)im
    r16 = cos(15pi/10) + sin(15pi/10)im
    r17 = cos(16pi/10) + sin(16pi/10)im
    r18 = cos(17pi/10) + sin(17pi/10)im
    r19 = cos(18pi/10) + sin(18pi/10)im
    r20 = cos(19pi/10) + sin(19pi/10)im

    R=[r1;r2;r3;r4;r5;r6;r7;r8;r9;r10;r11;r12;r13;r14;r15;r16;r17;r18;r19;r20]

    return f,df,R
end

function problemVI()
    f(z) = z^50 - 1
    df(z) = 50*(z^49)

    r1 = 1.0 + 0.0im
    r2 = cos(pi/25) + sin(pi/25)im
    r3 = cos(2pi/25) + sin(2pi/25)im
    r4 = cos(3pi/25) + sin(3pi/25)im
    r5 = cos(4pi/25) + sin(4pi/25)im
    r6 = cos(5pi/25) + sin(5pi/25)im
    r7 = cos(6pi/25) + sin(6pi/25)im
    r8 = cos(7pi/25) + sin(7pi/25)im
    r9 = cos(8pi/25) + sin(8pi/25)im
    r10 = cos(9pi/25) + sin(9pi/25)im
    r11 = cos(10pi/25) + sin(10pi/25)im
    r12 = cos(11pi/25) + sin(11pi/25)im
    r13 = cos(12pi/25) + sin(12pi/25)im
    r14 = cos(13pi/25) + sin(13pi/25)im
    r15 = cos(14pi/25) + sin(14pi/25)im
    r16 = cos(15pi/25) + sin(15pi/25)im
    r17 = cos(16pi/25) + sin(16pi/25)im
    r18 = cos(17pi/25) + sin(17pi/25)im
    r19 = cos(18pi/25) + sin(18pi/25)im
    r20 = cos(19pi/25) + sin(19pi/25)im
    r21 = cos(20pi/25) + sin(20pi/25)im
    r22 = cos(21pi/25) + sin(21pi/25)im
    r23 = cos(22pi/25) + sin(22pi/25)im
    r24 = cos(23pi/25) + sin(23pi/25)im
    r25 = cos(24pi/25) + sin(24pi/25)im
    r26 = -1.0 + 0.0im
    r27 = cos(26pi/25) + sin(26pi/25)im
    r28 = cos(27pi/25) + sin(27pi/25)im
    r29 = cos(28pi/25) + sin(28pi/25)im
    r30 = cos(29pi/25) + sin(29pi/25)im
    r31 = cos(30pi/25) + sin(30pi/25)im
    r32 = cos(31pi/25) + sin(31pi/25)im
    r33 = cos(32pi/25) + sin(32pi/25)im
    r34 = cos(33pi/25) + sin(33pi/25)im
    r35 = cos(34pi/25) + sin(34pi/25)im
    r36 = cos(35pi/25) + sin(35pi/25)im
    r37 = cos(36pi/25) + sin(36pi/25)im
    r38 = cos(37pi/25) + sin(37pi/25)im
    r39 = cos(38pi/25) + sin(38pi/25)im
    r40 = cos(39pi/25) + sin(39pi/25)im
    r41 = cos(40pi/25) + sin(40pi/25)im
    r42 = cos(41pi/25) + sin(41pi/25)im
    r43 = cos(42pi/25) + sin(42pi/25)im
    r44 = cos(43pi/25) + sin(43pi/25)im
    r45 = cos(44pi/25) + sin(44pi/25)im
    r46 = cos(45pi/25) + sin(45pi/25)im
    r47 = cos(46pi/25) + sin(46pi/25)im
    r48 = cos(47pi/25) + sin(47pi/25)im
    r49 = cos(48pi/25) + sin(48pi/25)im
    r50 = cos(49pi/25) + sin(49pi/25)im

    R=[r1;r2;r3;r4;r5;r6;r7;r8;r9;r10;r11;r12;r13;r14;r15;r16;r17;r18;r19;r20;r21;r22;r23;r24;r25;r26;r27;r28;r29;r30;r31;r32;r33;r34;r35;r36;r37;r38;r39;r40;r41;r42;r43;r44;r45;r46;r47;r48;r49;r50]

    return f,df,R
end

function problemVII()
    f(z) = -z^3 - 2*z^2 - 3*z - 2
    df(z) = -3*z^2 - 4*z - 3

    r1 = -1.0 + 0.0im
    r2 = -0.5 + 1.32287565553im
    r3 = -0.5 - 1.32287565553im

    R=[r1;r2;r3]

    return f,df,R
end

function problemVIII(k1, k2, k3, a, b, c)
    f(z) = (z-k1)^a * (z-k2)^b * (z-k3)^c
    term1(z) = a * (z - k1)^(a - 1) * (z - k2)^b * (z - k3)^c
    term2(z) = b * (z - k1)^a * (z - k2)^(b - 1) * (z - k3)^c
    term3(z) = c * (z - k1)^a * (z - k2)^b * (z - k3)^(c - 1)
    df(z) = term1(z) + term2(z) + term3(z)

    R=[k1;k2;k3]

    return f, df, R
end

function problemIX()
    k1 = 1.0 + 3.0im
    k2 = 3.0 + 3.0im
    k3 = 2.0 + 1.268im
    a = 1
    b = 1
    c = 2
    f(z) = (z-k1)^a * (z-k2)^b * (z-k3)^c
    term1(z) = a * (z - k1)^(a - 1) * (z - k2)^b * (z - k3)^c
    term2(z) = b * (z - k1)^a * (z - k2)^(b - 1) * (z - k3)^c
    term3(z) = c * (z - k1)^a * (z - k2)^b * (z - k3)^(c - 1)
    df(z) = term1(z) + term2(z) + term3(z)

    R=[k1;k2;k3]

    return f, df, R
end
