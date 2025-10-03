# Método de Newton
function newton_method(x0,f,df; tol=1e-12, max_iter=40)
    x = x0
    for iter in 0:max_iter
        fx=f(x)
        dfx=df(x)
        
        if abs(fx) < tol # Critério de convergência
            return x,iter
        end

        # Salvaguardando uma possível divisão por zero 
        if abs(dfx) <  1.e-1 * tol
            return NaN,-1 # -1 indica que a derivada em módulo é muito pequena
        end

        x=x-fx/dfx # atualizando a sequência xk pelo método de Newton

    end
    return NaN,-2 # -2 informa que o método não convergiu em max_iter iterações
end

