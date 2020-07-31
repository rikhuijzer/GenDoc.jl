using Documenter
using GenDoc

include("../gendocdocs/myexamples.jl")

makedocs(sitename = "GenDoc.jl",
    pages = [
        "Introduction" => "index.md",
        "Getting Started" => "gettingstarted.md",
        "Examples" => "examples.md",
        "My examples" => write_myexamples()
    ]
)

deploydocs(
    repo = "github.com/rikhuijzer/GenDoc.jl.git",
    deps = nothing,
    make = nothing
)
