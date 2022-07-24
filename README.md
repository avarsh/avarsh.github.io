# avarsh.github.io

My personal website and blog, written in pure HTML/CSS/JS with no additional frameworks.
Post generation is done through pandoc, using the following command:
```
pandoc --toc --mathjax -f markdown -t html -c /css/post.css -c /css/page.css --template post-template.html source.md -o output.html
```