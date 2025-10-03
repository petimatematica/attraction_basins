# Método de Newton puro empregado no problema de encontrar zero de funções complexas holomorfas
#----------------------------------------------------------------------------------------------
#= 
Variáveis obrigatórias:
- x0 (ComplexF64) - chute inicial
- f (Function) - função complexa holomorfa que desejamos resolver o problema f(z)=0
- df (Function) - derivada de f

Variáveis opcionais:
- tol (Float64) - tolerância utilizada no critério de parada (padrão 10^{-12})
- max_iter (Int64) - número máximo de iteradas (padrão 40 iteradas)
=#
#----------------------------------------------------------------------------------------------

function newton_method(x0,f,df; tol=1e-12, max_iter=40)
    x = x0 # inicializando a variável que armazena o k-ésimo termo da sequência gerada pelo Método de Newton na k-ésima iterada
    for iter in 0:max_iter # Salvaguardando de um loop infinito
        fx=f(x); dfx=df(x) # Variáveis para reduzir a quantidade de avaliação de função
        
        if abs(fx) < tol # Critério de parada
            return x,iter # retorne a solução aproximada e o número de iteradas
        end

        # Salvaguardando uma possível divisão por zero 
        if abs(dfx) <  1.e-1 * tol
            return NaN,-1 # -1 indica que a derivada em módulo é muito pequena
        end

        x=x-fx/dfx # atualizando a sequência xk pelo método de Newton

    end
    return NaN,-2 # -2 informa que o método não convergiu em max_iter iterações
end
