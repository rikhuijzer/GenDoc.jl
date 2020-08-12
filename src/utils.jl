export
    is_gitlab_ci

"""
    is_gitlab_ci()::Bool

Return whether this project is being executed on GitLab's CI.
"""
is_gitlab_ci()::Bool = "CI_PIPELINE_SOURCE" in keys(ENV)

"""
    project_root()::String

Return the root directory of the project.
"""
function project_root()::String
    dirparent(dir) = splitdir(endswith(dir, '/') ? dir[1:end-1] : dir)[1]
    dirparent(dir, n) = ∘(repeat([dirparent], n)...)(dir)
    dirparent(pathof(GenDoc), 2)
end
