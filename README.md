# GenDoc <img src="https://huijzer.xyz/images/GenDoc-crop.svg" align="right">

<h3>
  Generate Markdown documents
</h3>

| **Documentation** | **Test status** |
|:---:|:---:|:---:|
| [![][docs-dev-img]](docs-dev-url) | [![][tests-img](tests-url) | 


[//]: # (Show a kind of abstract on this page and a bigger introduction in the docs at `index`.)

This project arose out of a lack of flexibility in existing notebook solutions such as [Jupyter Notebook](https://jupyter.org), [R Markdown](https://rmarkdown.rstudio.com/) and [Weave.jl](https://github.com/JunoLab/Weave.jl).
They introduce special syntax which constrain capabiltities available in the underlying language.
For example, existing notebook solutions

- do not allow users to apply a function to all code blocks,
- tend to hinder existing language tooling such as test suits and reformatters and
- do not automatically reload changed code, see Section [Reload](#reload).

## Reload
In R Markdown and Jupyter Notebook, I am often switching between running the document fully and running only sections.
For example, when using three code blocks named 1, 2 and 3, it is typically required to update 1 or 2 before running 3.
Running the full document ensures that document is consistent and will update all blocks.
However, this can take a long time for computation heavy documents.
On the other hand, re-running the block 1 and/or 2 manually is laborious.
This problem is especially noticable when one of the earlier blocks contains an import of another homemade, and therefore changing, package.
[Revise.jl](https://github.com/timholy/Revise.jl) solves this since it will reload changes while keeping the Julia session active.
Specifically, with Revise: let all the blocks be functions instead of blocks. 
When we try to run function 3 after changing function 1, Revise will notice that function 1 has changed and run function 1 before running function 3.

[docs-dev-img]: https://github.com/rikhuijzer/GenDoc.jl/workflows/docs/badge.svg
[docs-dev-url]: https://rikhuijzer.github.io/GenDoc.jl/dev

[tests-img]: https://github.com/rikhuijzer/GenDoc.jl/workflows/tests/badge.svg
[tests-url]: https://github.com/rikhuijzer/GenDoc.jl/actions
