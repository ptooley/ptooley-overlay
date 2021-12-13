#!/bin/bash

tmpdir=$(mktemp -d)
tree=$(git write-tree)
git archive $tree | tar -x -C $tmpdir

cd $tmpdir
repoman
result=$?
cd ..
rm -r $tmpdir

exit $result
