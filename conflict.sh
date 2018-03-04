#!/bin/sh

# This script creates a new directory, tutarial-repos/local/, with a
# merge conflict.  You can practice resolving that conflict to ensure
# mastery of Git and of your merge tool.

set -e

rm -rf tutorial-repos

# Make the common commit in lincoln-remote.
mkdir -p tutorial-repos/lincoln-remote
cd tutorial-repos/lincoln-remote
git init
cp ../../alincoln-draft-one.txt gettysburg_address.txt
git add gettysburg_address.txt
git commit -m "Add first draft of my address" --author "Abraham Lincoln <alincoln@whitehouse.gov>"
cd ../

# Clone lincoln-remote and add the Associated Press's account of the address.
git clone lincoln-remote local
cd local
cp ../../my-edits-to-draft-one.txt gettysburg_address.txt
git commit gettysburg_address.txt -m "Make grammar edits to the address"
cd ../

# Return to the remote and add the official account of the address.
cd lincoln-remote
cp ../../alincoln-draft-two.txt gettysburg_address.txt
git commit gettysburg_address.txt -m "Add final draft of my address" --author "Abraham Lincoln <alincoln@whitehouse.gov>"

# If you run `git pull` in the local repo, there will be a conflict.
