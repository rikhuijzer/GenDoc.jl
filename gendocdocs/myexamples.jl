using GenDoc

"""
    write_examples

Writes a Markdown file containing example uses for GenDoc.
The output file is then further processed by `Documenter.jl`.
"""
function write_myexamples()
    filename = "myexamples.md"

    text = """
        # My examples
        
        ```
        1 + 1
        $(1 + 1)
        ```
        """

    target_path = joinpath(project_root(), "docs", "src", filename)
    io = open(target_path, "w")
    write(io, text)
    close(io)
    return filename
end
