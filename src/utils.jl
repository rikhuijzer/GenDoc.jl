export
    is_ci

is_github_ci()::Bool = ENV["CI"] == true
is_gitlab_ci()::Bool = "CI_PIPELINE_SOURCE" in keys(ENV)

"""
    is_ci()::Bool

Return whether this project is being executed on GitHub's or GitLab's CI.
"""
is_ci()::Bool = is_gitlab_ci() || is_github_ci()

"""
    project_root()::String

Return the root directory of GenDoc.jl.
"""
function project_root()::String
    dirparent(dir) = splitdir(endswith(dir, '/') ? dir[1:end-1] : dir)[1]
    dirparent(dir, n) = ∘(repeat([dirparent], n)...)(dir)
    dirparent(pathof(GenDoc), 2)
end
