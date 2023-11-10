module TestPackage01

export trapezoidal


"""
calculates trapezoidal rule for calculating integral
"""
function trapezoidal(a, b, f, N=100000)
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

function testdocumentation()
    print("Test done")
end

end # module ExamplePackage