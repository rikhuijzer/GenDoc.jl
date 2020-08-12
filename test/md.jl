using DataFrames
using GenDoc
using RCall
using Test

@testset "md" begin
    front_matter = generate_front_matter(title="test")
    @test occursin("title: test", front_matter)

    @test occursin("margin-top:1cm", hspace(1))

    df = DataFrame(a = 1, b_1 = ["C"])
    @test md(df) == """
        a | b_1
        --- | ---
        1 | C
        """

    @test pretty(df) == """
        A | B 1
        --- | ---
        1 | C
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
