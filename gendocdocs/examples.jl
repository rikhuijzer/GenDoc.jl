using GenDoc

"""
    write_examples

Writes a Markdown file containing example uses for GenDoc.
The output file is then further processed by `Documenter.jl`.
"""
function write_examples()
    # Allows generated Markdown files to be added to `.gitignore`.
    filename = "gen_examples.md"

    text = """
# Examples

This page contains some examples.


## asmd

```@docs
@asmd
```

$(@asmd 1 + 1)

"""

    target_path = joinpath(project_root(), "docs", "src", filename)
    io = open(target_path, "w")
    write(io, text)
    close(io)
    return filename
end
