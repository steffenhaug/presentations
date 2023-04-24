function square!(xs)
  for i in eachindex(xs)
    xs[i] ^= 2
  end
end

V = rand(10000);
@code_native syntax=:intel square(V)
