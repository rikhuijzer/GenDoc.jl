using Documenter
using GenDoc

include("../gendocdocs/gettingstarted.jl")

makedocs(sitename = "GenDoc.jl",
    pages = [
        "Getting started" => write_gettingstarted()
    ]
)

deploydocs(repo = "github.com/rikhuijzer/GenDoc.jl.git")
