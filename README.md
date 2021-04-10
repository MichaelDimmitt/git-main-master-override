## git-main-master-override
if its master go master ... <br/>
if its main go main ...

To see all overrides check:
https://github.com/MichaelDimmitt/my-bashrc-git-overrides

## How it works (TLDR)
Improve your git command by adding this content to your ~/.bashrc or ~/.bashrc.local 🎉
```bash
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
```
