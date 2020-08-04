using Test
using GenDoc

import RCall

"""
    @wrap_tmpdir ex

Creates a temporary directory to be used by the expression `ex`.
After executing the expression, the macro ensures that the directory is removed.
"""
macro wrap_tmpdir(ex) 
    return esc(:(
        tmpdir = tempname() * '/';
        mkdir(tmpdir);
        try;
            $ex;
        catch e;
            rm(tmpdir, recursive=true)
            throw(e)
        end;
        rm(tmpdir, recursive=true)
    ))
end

@testset "GenDoc" begin
    include("md.jl")
end
