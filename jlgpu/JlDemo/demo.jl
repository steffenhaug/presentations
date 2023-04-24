using .Threads: @threads, Atomic
using LinearAlgebra

## Microbenchmarks
function pdot(v, w)
    vw = Atomic{Float64}(0.0)
    @threads for i in eachindex(v)
        @inbounds Threads.atomic_add!(vw, v[i] * w[i])
    end
    vw[]
end

function sdot(v, w)
    vw = 0.0
    for i in eachindex(v)
        @inbounds vw += v[i] * w[i]
    end
    vw
end

## Non-const globals will fuck you in the ass

const Δx = 0.1

function riemann!(X, x)
    N = length(x)
    X[1] = 0.0
    for i in 2:N
        X[i] = X[i - 1] + Δx * X[i]
    end
end

v = rand(100000)
V = zeros(100000)
@time riemann!(V, v)

## CUDA
using CUDA

v = CUDA.rand(10000000);
Nt = 1024
Nb = ceil(Int, length(v) / Nt)

function cusquare!(xs)
    i = (blockIdx().x - 1) * blockDim().x + threadIdx().x

    if i < length(xs)
        xs[i] *= xs[i]
    end

    return
end


## Run some gpu code
@time CUDA.@sync begin
    @cuda threads=Nt blocks=Nb cusquare!(v)
end

## Check out the SASS
@device_code_typed @cuda threads=Nt blocks=Nb cusquare!(v)

## Serial comparison
v = rand(10000000);

function square!(xs)
    xs .^= 2
end

##
@time begin
    square!(v)
    nothing
end
