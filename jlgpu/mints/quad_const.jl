const Δx = 0.1

function riemann!(X, x)
    N = length(x)
    X[0] = 0.0
    for i in 2:N
        X[i] = X[i - 1] + Δx * X[i]
    end
end

v = rand(100000)
V = zeros(100000)
@time riemann!(V, v)
