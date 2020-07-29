module GenDoc

"""
    hello(who::String)

Return "Hello, `who`".
"""
hello(who::String) = "Hello, $who"
export hello

"""
    domath(x::Number)

Return `x + 5`.
"""
domath(x::Number) = x + 5
export domath

end # module
