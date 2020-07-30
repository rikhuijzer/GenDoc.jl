using Documenter, GenDoc

makedocs(modules = [GenDoc], sitename = "GenDoc.jl")

deploydocs(repo = "github.com/rikhuijzer/GenDoc.jl.git")
