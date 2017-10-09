#!/bin/sh
rm -rf _book
gitbook build
cd _book
git init 
git checkout --orphan gh-pages
git add .
git commit -m "Auto publisher"
git remote add origin https://github.com/laniakea1990/test_book.git 
git push --force -u origin gh-pages > /dev/null 2>&1
