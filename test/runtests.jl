using PerlaTonettiWaugh, Test, LinearAlgebra
using Distributions, Sundials, BenchmarkTools, Parameters, QuantEcon, Interpolations, NLsolve, Optim, DifferentialEquations, DiffEqCallbacks

@elapsed begin 
    @time @testset "Simple Stationary" begin include("simple/stationarytest.jl") end
    @time @testset "Full Stationary" begin include("full/stationarytest.jl") end
    @time @testset "Discretization and Rescaling Tests" begin include("discretizationtest.jl") end 
    @time @testset "Residuals/Dynamic ODE Tests" begin include("simple/residualstest.jl") end
    @time @testset "Full Dynamic" begin include("full/dynamictest.jl") end
end 
