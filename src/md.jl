using Dates

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
