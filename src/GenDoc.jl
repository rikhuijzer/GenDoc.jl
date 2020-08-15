module GenDoc

if isdefined(Base, :Experimental) && isdefined(Base.Experimental, Symbol("@optlevel"))
    @eval Base.Experimental.@optlevel 1
end

include("utils.jl")
include("md.jl")

end # module
