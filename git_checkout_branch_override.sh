#!/bin/bash
branchOverride() {
    gitCommand="$*"
    errormessage=$(echo "$gitCommand" | exec 2>&1)
    checkBranch "$errormessage"
}
## posix compliant solution:
checkBranch() {
    result=$*
    if [ -z "${result##*'master'*}" ] ;then
        command git checkout main
    elif [ -z "${result##*'main'*}" ] ;then
        command git checkout master
    else
        echo "$result"
    fi
}
git() {
  if [ "$1" == "checkout" ]; then
    branchOverride "git $*";
  fi
}
git checkout master
