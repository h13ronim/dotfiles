function branchize() {
  echo "$@" | tr ' ' '-' | tr '[A-Z]' '[a-z]' | tr '[' '-' | tr ']' '-' | tr '#' '-' | sed -e 's/--/-/g' | sed -e 's/--/-/g'
}

function git_track_branch() {
  for BRANCH in $1
  do
    git fetch origin
    git checkout --track -b $BRANCH origin/$BRANCH
    git pull
  done
}

function git_create_branch() {
  for BRANCH in $1
  do
    git push origin origin:refs/heads/$BRANCH
    git_track_branch $BRANCH
  done
}
