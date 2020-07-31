var documenterSearchIndex = {"docs":
[{"location":"gettingstarted/#Getting-started-1","page":"Getting started","title":"Getting started","text":"","category":"section"},{"location":"gettingstarted/#","page":"Getting started","title":"Getting started","text":"The GenDoc package is loaded via ","category":"page"},{"location":"gettingstarted/#","page":"Getting started","title":"Getting started","text":"using GenDoc","category":"page"},{"location":"gen_examples/#Examples-1","page":"Examples","title":"Examples","text":"","category":"section"},{"location":"gen_examples/#","page":"Examples","title":"Examples","text":"This page contains some examples.","category":"page"},{"location":"gen_examples/#","page":"Examples","title":"Examples","text":"DocTestSetup = :(using GenDoc)","category":"page"},{"location":"gen_examples/#withcb-1","page":"Examples","title":"withcb","text":"","category":"section"},{"location":"gen_examples/#","page":"Examples","title":"Examples","text":"The most basic functionality of notebooks is showing code alongside the output. This can be done via @withcb.","category":"page"},{"location":"gen_examples/#","page":"Examples","title":"Examples","text":"@withcb","category":"page"},{"location":"gen_examples/#GenDoc.@withcb","page":"Examples","title":"GenDoc.@withcb","text":"@withcb ex\n\nReturns the output of the evaluated expression eval(ex) after the expression ex inside a Markdown code block. Returns the expression ex inside a Markdown code block and the output of eval(ex).\n\nSimilar to default behaviour of R Markdown code blocks.\n\n\n\n\n\n","category":"macro"},{"location":"gen_examples/#","page":"Examples","title":"Examples","text":"For example, inside a string, use","category":"page"},{"location":"gen_examples/#","page":"Examples","title":"Examples","text":"$(@withcb 1 + 1)\n$(@withcb string(\"Solve \", 1 + 1, '.')","category":"page"},{"location":"gen_examples/#","page":"Examples","title":"Examples","text":"to respectively obtain","category":"page"},{"location":"gen_examples/#","page":"Examples","title":"Examples","text":"1 + 1","category":"page"},{"location":"gen_examples/#","page":"Examples","title":"Examples","text":"2","category":"page"},{"location":"gen_examples/#","page":"Examples","title":"Examples","text":"and","category":"page"},{"location":"gen_examples/#","page":"Examples","title":"Examples","text":"string(\"Solve \", 1 + 1, '.')","category":"page"},{"location":"gen_examples/#","page":"Examples","title":"Examples","text":"Solve 2.","category":"page"},{"location":"#GenDoc-1","page":"Introduction","title":"GenDoc","text":"","category":"section"},{"location":"#","page":"Introduction","title":"Introduction","text":"Documentation for GenDoc.","category":"page"},{"location":"#","page":"Introduction","title":"Introduction","text":"Modules = [GenDoc]","category":"page"},{"location":"#GenDoc.df2md-Tuple{DataFrames.DataFrame}","page":"Introduction","title":"GenDoc.df2md","text":"df2md(df::DataFrame)\n\nConvert DataFrame to String.\n\n\n\n\n\n","category":"method"},{"location":"#GenDoc.generate_front_matter-Tuple{Dict{String,String}}","page":"Introduction","title":"GenDoc.generate_front_matter","text":"generate_front_matter(vars::Dict{String,String})\n\nGenerates YAML front matter based on given vars.\n\n\n\n\n\n","category":"method"},{"location":"#GenDoc.rplot-NTuple{4,Any}","page":"Introduction","title":"GenDoc.rplot","text":"rplot\n\nTransform R plot plot object to string. The plot will be stored at path_prefix / filename. The string will point to an image generated by the R plot, located at uri_prefix / filename.\n\nTo avoid constantly passing path_prefix and url_prefix, consider using partial function application.\n\n\n\n\n\n","category":"method"},{"location":"#GenDoc.@withcb-Tuple{Expr}","page":"Introduction","title":"GenDoc.@withcb","text":"@withcb ex\n\nReturns the output of the evaluated expression eval(ex) after the expression ex inside a Markdown code block. Returns the expression ex inside a Markdown code block and the output of eval(ex).\n\nSimilar to default behaviour of R Markdown code blocks.\n\n\n\n\n\n","category":"macro"}]
}
