"""
    project_root()::String

Return the root directory of the project.
"""
function project_root()::String
    dirparent(dir) = splitdir(endswith(dir, '/') ? dir[1:end-1] : dir)[1]
    dirparent(dir, n) = ∘(repeat([dirparent], n)...)(dir)
    dirparent(pathof(GenDoc), 2)
end
