#!/bin/bash
main() {
    errormessage=$(git checkout main 2>&1)
    checkBranch $errormessage
}
## posix compliant solution:
checkBranch() {
    result=$*
    if [ -z "${result##*master*}" ] ;then
        git checkout main
    elif [ -z "${result##*main*}" ] ;then
        git checkout master
    else
        echo "$result"
    fi
}
main
