using Test
using GenDoc

import RCall

function test_rcall()
    lsd = RCall.reval("ls(\"package:datasets\")")
    @test isa(lsd, RCall.RObject{RCall.StrSxp})
    @test length(lsd) > 50
end

@testset "GenDoc" begin
    test_rcall()

    include("md.jl")
end
