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
    res = zeros(f.length)
    delta_x = (b-a)/N
    x_k_1 = a
    for i in 1:N
        for j in 1:f.length
            x_k_1 = a + (i-1)*delta_x 
            x_k = x_k_1 + delta_x
            res[j] += (f[j](x_k_1) + f[j](x_k))/2 * delta_x
        end
    end
    return res
end

f(x) = cos(200*x)
#f(x) = (1, x, x^2, x^3)

@show trapezoidal(0,1, f)