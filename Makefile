publish:
	rm -rf _book
	gitbook build
	cd _book && git init && git add . && git commit -m 'Auto publisher' && git push --force --quiet "https://github.com/laniakea1990/test_book.git" master:gh-pages > /dev/null 2>&1
