import TestPackage01
using Test

@test trapezoidal(0,1,identity) ≈ [0.5]