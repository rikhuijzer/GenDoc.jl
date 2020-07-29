<h1 align="center">
  GenDoc
</h1>

<p align="center">
  Generate documents, such as Markdown and LaTeX, from Julia.
</p>


<p align="center">
  <a href="https://travis-ci.org/rikhuijzer/GenDoc.jl"><img src="https://travis-ci.org/rikhuijzer/GenDoc.jl.svg?branch=master"></a>
</p>

This project arose out of a lack of flexibility in existing notebook solutions such as [Jupyter Notebook](https://jupyter.org), [R Markdown](https://rmarkdown.rstudio.com/) and [Weave.jl](https://github.com/JunoLab/Weave.jl).
They introduce special syntax which constrains capabiltities.
Capabilities which would be available in the underlying language.
For example, they do not allow users to apply a function to all generated codeblocks.
As another example, they tend to hinder existing language tooling such as test suits and reformatters.
