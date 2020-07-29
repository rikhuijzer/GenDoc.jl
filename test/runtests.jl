using Test
using GenDoc

@test hello("Julia") == "Hello, this aims to fail a test."
@test domath(2.0) ≈ 7.0
