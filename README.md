# avarsh.github.io

My personal website and blog, written in pure HTML/CSS/JS with no additional frameworks.
The `generate-blog-page.sh` script takes care of generating the posts using the above command and updating the blog page, by 
reading the `blog/markdown/directory` file which contains the details of each post in the following format
```
Title
Date
Preview Text
Filename without extensions
```
Pandoc is used used by the script to generate the html code from each blog post.
```
pandoc --toc --mathjax -f markdown -t html -c /css/post.css -c /css/page.css --template post-template.html --metadata title="Post" source.md -o output.html
```

The sass code may be compiled into css using
```
dart-sass --watch scss:css
```