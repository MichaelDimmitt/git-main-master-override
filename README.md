## git-main-master-override
if its master go master ... <br/>
if its main go main ...

To see all overrides check:
https://github.com/MichaelDimmitt/my-bashrc-git-overrides

## How it works (TLDR)
Improve your git command by adding this content to your ~/.bashrc or ~/.bashrc.local 🎉
```bash
branchOverride() {
    projectBranch=$(git branch | grep -E 'master|main' | head -n 1 | sed 's/*//');

    # what branch did user request?
    substr1="master"
    substr2="main"
    string="$*"

    if [ -z "${string##*$substr1*}" ] ;then
        command git checkout $projectBranch
    elif [ -z "${string##*$substr2*}" ] ;then
        command git checkout $projectBranch
    else
        command git $*
    fi
}
git() {
  if [ "$1" == "checkout" ]; then
    branchOverride "git $*";
  fi
}
```
