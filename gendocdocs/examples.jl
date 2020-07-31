using GenDoc
using RCall

"""
    write_examples

Writes a Markdown file containing example uses for GenDoc.
The output file is then further processed by `Documenter.jl`.
"""
function write_examples()
    # Allows generated Markdown files to be added to `.gitignore`.
    filename = "gen_examples.md"

    analysis_example = raw"""
    ```
    function fancy_analysis()
        # Here some fancy analysis is executed.
        return 4
    end

    text = raw"
        --- 
        title: Analysis
        ---

        After a lot of research, I conclude that the average is $(fancy_analysis()).
        "

    io = open("analysis.md", "w")
    write(io, text)
    close(io)
    ```
    which creates the file `analysis.md` containing
    ```
    ---
    title: Analysis
    ---

    After a lot of research, I conclude that the average is 4.
    ```
    """

    text = """
# Quick start

The main purpose of GenDoc.jl is to provide users with lots of freedom when generating documents.
Achieving this without this package is possible.
A simple approach would be to generate a Markdown creating `analysis.jl` and writing

$(analysis_example)

After doing this for a few documents, the code will become quite repetitive.

```@meta
DocTestSetup = :(using GenDoc)
```

## Showing code blocks

To show the evaluted result with the code block, use `@withcb`.
For example, inside a string, use

```
$(raw"""$(@withcb begin 1 + 1 end)""")
```

to obtain the following Markdown:
````
$(@withcb begin 1 + 1 end)
````

After the Markdown renderer, this looks like

$(@withcb begin 1 + 1 end)

This macro is used to show the next examples, that is, by using

```
$(raw"""$(@withcb begin ... end)""")
```

## Including plots

Plot are first stored as images and then referenced from the generated document.
Here, we store the R plot `p` as `gen_plot.png`.

$(@withcb begin
    p = R"
    library(ggplot2)
    ggplot(mpg, aes(displ, hwy)) + 
        geom_point()
    "
    uri_prefix = ""
    path_prefix = joinpath(project_root(), "docs", "src")
    rplot(p, "gen_plot.png", path_prefix, uri_prefix)
end)

## Including dataframes


"""

    target_path = joinpath(project_root(), "docs", "src", filename)
    io = open(target_path, "w")
    write(io, text)
    close(io)
    return filename
end
