using DataFrames
using Dates
using RCall

"""
    generate_front_matter(vars::Dict{String,String})

Generates YAML front matter based on given `vars`.
"""
function generate_front_matter(vars::Dict{String,String})::String
    if !("date" in keys(vars))
        vars["date"] = string(Dates.today())
    end

    as_line(key::String) = "$(key): $(vars[key])"
    lines = join(map(as_line, collect(keys(vars))), '\n')
    """
    ---
    $lines
    ---

    [//]: # (GENERATED FILE. DO NOT MODIFY.)

    """
end
export generate_front_matter

"""
    df2md(df::DataFrame)

Converts DataFrame to String.
"""
function df2md(df::DataFrame; show_header=true)::String
  row2str(row::DataFrameRow) = join(values(row), " | ")

  if show_header 
    header = join(names(df), " | ")
  else
    header = join(repeat([' '], ncol(df)), " | ")
  end
  subheader = join(repeat(["---"], ncol(df)), " | ")
  body = join(map(i -> row2str(df[i, :]), 1:nrow(df)), '\n')
  
  return """
  $header
  $subheader
  $body
  """
end
export df2md
