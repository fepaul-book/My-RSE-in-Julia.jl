function trapezoidal(a, b, f::Function, N=100000)
    res = 0
    delta_x = (b-a)/N
    x_k_1 = a
    for i in 1:N
        x_k_1 = a + (i-1)*delta_x 
        x_k = x_k_1 + delta_x
        res += (f(x_k_1) + f(x_k))/2 * delta_x
    end
    return res
end

function multi_dim_trapezoidal(a, b, f, N=100000)
    res = zeros(length(f(0)))
    delta_x = (b-a)/N
    x_k_1 = a
    for i in 1:N
        x_k_1 = a + (i-1)*delta_x 
        x_k = x_k_1 + delta_x
        res .+= (f(x_k_1) .+ f(x_k))./2 .* delta_x
    end
    return res
end

f(x) = cos(200*x)
function g(x)
    return (1, x, x^2, x^3)
end

length(g(2))
@show multi_dim_trapezoidal(0,1, g)