using GenDoc
using Test

@testset "utils" begin
    @test isfile(joinpath(project_root(), "src", "GenDoc.jl"))
end
