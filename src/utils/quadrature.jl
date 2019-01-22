# New method.
function ω_weights(z, α, ξ)
     #=
        Notation: z consists of P points z_1, z_2, ..., z_M.
        Formula: For the interior points, the weights are given by [f(z_k)/2 * (Δ_k + Δ_{k+1})]
        where Δ_k = z_k - z_{k-1}. For the boundary points, the weights are given by [f(z_1)/2 * Δ_2]
        and [f(z_M)/2 * Δ_M]
    =#
    Δ = diff(z)
    P = length(z)
    prepend!(Δ, NaN) # To keep the indexing straight. Now, Δ[2] = Δ_2 = z_2 - z_1. And NaN will throw an error if we try to use it.
    z_bar = z[end]
    f_vec = (α * exp.(z * (ξ - α)))/(1 - exp(-α*z_bar)) # Get the vector of probability masses. (B.19)
    interiorWeights = [f_vec[i]/2 * (Δ[i] + Δ[i+1]) for i = 2:P-1] # Turn these into interior trapezoidal weights. (19)
    return [f_vec[1]/2 * Δ[2]; interiorWeights; f_vec[P]/2 * Δ[P]] # Add the boundary weights. (19, with ghost node definitions)
end
