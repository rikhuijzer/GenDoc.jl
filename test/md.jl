using GenDoc
using Test

@testset "md" begin
    front_matter = generate_front_matter(Dict("title"=>"test"))
    @test occursin("title: test", front_matter)
end
