using DataFrames
using GenDoc
using RCall
using Test

@testset "md" begin
    front_matter = generate_front_matter(title="test")
    @test occursin("title: test", front_matter)

    df = DataFrame(A = 1:2, B = ["A", "B"])
    @test md(df) == """
        A | B
        --- | ---
        1 | A
        2 | B
        """
    @test md(df; show_header=false) == """
          |  
        --- | ---
        1 | A
        2 | B
        """

    @wrap_tmpdir begin
        R"library(ggplot2)"
        plot = R"ggplot(cars)"
        filename = "plot.png"
        md_image = rplot(filename; path_prefix=tmpdir, uri_prefix=tmpdir, height=6)
        @test occursin("plot.png", md_image)
        @test isfile(joinpath(tmpdir, filename))
    end

end
