using DataFrames
using RCall

import MacroTools

export 
    generate_front_matter,
    md,
    rplot,
    pretty,
    @withcb
    
"""
    generate_front_matter(; kwargs...)

Generates YAML front matter based on given keyword arguments `kwargs`.
"""
function generate_front_matter(; kwargs...)::String
    as_line(pair) = "$(pair.first): $(pair.second)"
    lines = join(map(as_line, collect(kwargs)), '\n')
    """
    ---
    $lines
    ---

    [//]: # (GENERATED FILE. DO NOT MODIFY.)

    """
end

"""
    md(df::DataFrame)::String

Convert DataFrame `df` to Markdown syntax.
"""
function md(df::DataFrame)::String
    row2str(row::DataFrameRow) = join(values(row), " | ")

    header = join(names(df), " | ")
    subheader = join(repeat(["---"], ncol(df)), " | ")
    body = join(map(i -> row2str(df[i, :]), 1:nrow(df)), '\n')
  
    return """
    $header
    $subheader
    $body
    """
end

"""
    rplot(filename; path_prefix=nothing, uri_prefix=nothing, kwargs...)::String

Wrapper around the `ggsave` function from Tidyverse.
Keyword arguments `kwargs` are passed to `ggsave`.
Returns a string pointing to the image generated by `ggsave`.
The image is created at `path_prefix / filename`.
To avoid constantly passing `path_prefix` and `url_prefix`, consider creating a partial function.
"""
function rplot(filename; path_prefix=nothing, uri_prefix=nothing, kwargs...)::String
    file_path = path_prefix != nothing ? joinpath(path_prefix, filename) : filename
    args = merge(Dict("filename" => file_path), kwargs)
    args_r = R"$(robject(args))"
    R"do.call(ggsave, $args_r)"
    uri_path = uri_prefix != nothing ? joinpath(uri_prefix, filename) : filename
    return "![]($uri_path)"
end

"""
    pretty(df::DataFrame)::String

Make header of `df` prettier, by capitalising the first letter and removing underscores.
"""
function pretty(df::DataFrame)::String
    lines = split(md(df), '\n')
    lines[1] = replace(lines[1], '_' => ' ')
    lines[1] = join(map(uppercasefirst, split(lines[1], " | ")), " | ")
    join(lines, '\n')
end

function withcb_helper(ex::Expr)
    ex = MacroTools.rmlines(ex)
    ex = join(lstrip.(split(string(ex), '\n')[2:end-1]), '\n')
    """
    ```
    $(MacroTools.rmlines(ex))
    ```
    """
end

"""
    @withcb ex

Return the expression `ex` inside a Markdown code block and the output of `eval(ex)`.

Similar to default behaviour of R Markdown code blocks.
"""
macro withcb(ex::Expr)
    # This is a macro since `ex` should be evaluated in the macro call environment.
    return esc(:(string(
        # Note that `GenDoc.withcb_helper` is resolved in the macro call environment.
        $(GenDoc.withcb_helper(ex)), '\n',
        $(eval(ex))
    )))
end
