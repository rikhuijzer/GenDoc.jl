using Test
using GenDoc

import RCall

function test_rcall()
    lsd = RCall.reval("ls(\"package:datasets\")")
    @test isa(lsd, RCall.RObject{RCall.StrSxp})
    @test length(lsd) > 50
end

test_rcall()
@test hello("Julia") == "Hello, Julia"
@test domath(2.0) ≈ 7.0
