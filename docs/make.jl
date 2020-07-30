using Documenter, GenDoc

makedocs(modules = [Example], sitename = "GenDoc.jl")

deploydocs(repo = "github.com/rikhuijzer/gendoc.jl.git")
