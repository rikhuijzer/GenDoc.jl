using Documenter
using GenDoc

include("../gendocdocs/gettingstarted.jl")

makedocs(
    sitename = "GenDoc.jl",
    pages = [
        "Introduction" => "index.md",
        "Getting started" => write_gettingstarted()
    ],
    format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true")
)

deploydocs(repo = "github.com/rikhuijzer/GenDoc.jl.git")
