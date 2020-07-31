using Documenter
using GenDoc

include("../gendocdocs/examples.jl")

makedocs(sitename = "GenDoc.jl",
    pages = [
        "Introduction" => "index.md",
        "Getting started" => "gettingstarted.md",
        "Examples" => write_examples()
    ]
)

deploydocs(
    repo = "github.com/rikhuijzer/GenDoc.jl.git",
    deps = nothing,
    make = nothing
)
