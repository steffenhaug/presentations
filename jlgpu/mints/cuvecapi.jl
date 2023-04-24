using CUDA

# In-place operations.
v = CUDA.rand(10000000)
v *= 10.0
v ^= 2
v .= sqrt.(v)

# Parallel scan.
w = CUDA.zeros(10000000)
accumulate!(max, w, v)

# FFT (10M-point FFT takes 200ms on 980)
using CUDA.CUFFT
ω = fft(v)

# Kernels get fused
w .= w.^2 .+ v

# Check out what happens on the GPU
@device_code_sass w .= w.^2 .+ v
