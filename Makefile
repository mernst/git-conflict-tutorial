# This Makefile creates the distribution.
# If you are doing the exercise, see file git-conflict-resolution.html.

zip: ../git-conflict-tutorial.zip

../git-conflict-tutorial.zip: 
	rm -rf *~
	cd .. && zip -r git-conflict-tutorial git-conflict-tutorial

publish: zip
	mv git-conflict-tutorial.zip ../../website/resources/
