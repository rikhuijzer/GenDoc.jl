# GenDoc.jl

```@raw html
<p align="center">
    <img src="https://huijzer.xyz/images/GenDoc-crop.svg">
</p>
```

The aim of this project is to support users in generating documents.
The source code is first converted into Markdown, which in turn can be converted to the following output formats

- HTML (via Hugo or Julia Markdown),
- PDF (via LaTeX) or
- Doc (via Pandoc).

Since all the source files are directly called from within Julia, it is possible to generate multiple output files.
For example, two HTML pages where the HTML pages use different citation styles.

## Package features

- Output R plots and DataFrames to HTML, see [Getting started](gen_gettingstarted.html).

