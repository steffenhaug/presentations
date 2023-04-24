using CUDA
v = CUDA.rand(10000000);


function cusquare!(xs)
    i = (blockIdx().x - 1) * blockDim().x + threadIdx().x
    if i < length(xs)
        xs[i] *= xs[i]
    end
    return nothing
end

Nt = 1024
Nb = ceil(Int, length(v) / Nt)
@cuda threads=Nt blocks=Nb cusquare!(v)
