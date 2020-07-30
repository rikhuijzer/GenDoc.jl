<h1 align="center">
  GenDoc
</h1>

<p align="center">
  Generate Markdown documents from Julia.
  Furthermore, this project aims to generate LaTeX and Word documents via Pandoc and websites via Hugo.
</p>


<p align="center">
  <a href="https://travis-ci.org/rikhuijzer/GenDoc.jl"><img src="https://travis-ci.org/rikhuijzer/GenDoc.jl.svg?branch=master"></a>
</p>

This project arose out of a lack of flexibility in existing notebook solutions such as [Jupyter Notebook](https://jupyter.org), [R Markdown](https://rmarkdown.rstudio.com/) and [Weave.jl](https://github.com/JunoLab/Weave.jl).
They introduce special syntax which constrain capabiltities available in the underlying language.
For example, existing notebook solutions

- do not allow users to apply a function to all generated codeblocks,
- tend to hinder existing language tooling such as test suits and reformatters and
- cannot use the functionality of [Revise.jl], see Section [Revise](#revise).

## Revise
In R Markdown and Jupyter Notebook, I am required to choose between running the document fully and running only sections.
When using three codeblocks named 1, 2 and 3, it is typically required to update 1 or 2 before running 3.
Running the full document ensures that document is consistent and will update all blocks.
However, this can take a long time for non-trivial documents.
On the other hand, re-running the block 1 and/or 2 manually is laborious.
This problem is especially noticable when one of the earlier blocks contains an import of another homemade, and therefore changing, package.

## Closing remarks
For now, this project has [RCall.jl](https://github.com/JuliaInterop/RCall.jl) in its dependencies.
It might be better to move the R stuff out at some point to avoid this dependency.
