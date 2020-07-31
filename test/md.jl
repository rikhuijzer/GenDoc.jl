using DataFrames
using GenDoc
using RCall
using Test

@testset "md" begin
    front_matter = generate_front_matter(Dict("title"=>"test"))
    @test occursin("title: test", front_matter)

    df = DataFrame(A = 1:2, B = ["A", "B"])
    @test df2md(df) == """
        A | B
        --- | ---
        1 | A
        2 | B
        """
    @test df2md(df; show_header=false) == """
          |  
        --- | ---
        1 | A
        2 | B
        """

    @wrap_tmpdir begin
        R"library(ggplot2)"
        plot = R"ggplot(cars)"
        # Mostly a smoke test.
        @test occursin("plot.png", rplot(plot, "plot.png", tmpdir, tmpdir))
    end

end
