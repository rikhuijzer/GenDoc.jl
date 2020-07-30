using Documenter, GenDoc

makedocs(sitename = "GenDoc.jl",
    pages = [
        "Introduction" => "index.md",
        "Getting Started" => "gettingstarted.md"
    ]
)

deploydocs(
    repo = "github.com/rikhuijzer/GenDoc.jl.git",
    deps = nothing,
    make = nothing
)
