#!/usr/bin/bash

rm blog.html
cat blog-gen/blog-start >> blog.html

input="blog/markdown/directory"
sourcepath="blog/markdown/"
destpath="blog/html/"
counter=0
date=""
title=""
source=""
preview=""
while IFS= read -r line
do
  if [ `expr $counter % 4` == 0 ] 
  then
    title="$line"
    echo "$title"
  elif [ `expr $counter % 4` == 1 ]
  then
    date="$line"
    echo "$date"
  elif [ `expr $counter % 4` == 2 ]
  then
    preview="$line"'...'
  else
    source="$line"
  fi
  let counter=counter+1
  if [ `expr $counter % 4` == 0 ] 
  then
    # generate pandoc code
    src=$sourcepath$source".md"
    dest=$destpath$source".html"
    pandoc --toc --mathjax -f markdown -t html -c /css/post.css -c /css/page.css --template post-template.html --metadata title="$title" $src -o $dest

    sed -e 's/$title/'"$title"'/g' -e 's/$date/'"$date"'/g' -e 's/$preview/'"$preview"'/g' -e 's@$url@/'"$dest"'@g' blog-gen/post-list-template >> blog.html
  fi
done < "$input"

cat blog-gen/blog-end >> blog.html