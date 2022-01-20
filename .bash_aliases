# Alias for working with the dotfiles repo. Just use "config" instead of "git"
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Git and GitHub

# Get the names of the files that have been modified since previous commit (git
# diff previous commit)
alias gdfp='git diff --name-only HEAD~1'

# Get the names of the files that have been modified since last branch out. (git
# diff parent branch)
# TODO: Make it so it works without the origin branch being in sync
alias gdfpb='git diff --name-only $(git branch | sed -n -e "s/^\* \(.*\)/\1/p") $(git merge-base $(git branch | sed -n -e "s/^\* \(.*\)/\1/p") $(git log --decorate --simplify-by-decoration --oneline | grep -v "(HEAD" | head -n1 | sed "s/.* (\(.*\)) .*/\1/" | sed "s/,.*$//" | sed "s/origin\///"))'

# Check out the commit at last branch out. Takes an argument that will be
# matched against all filenames of modified files since last branch out. If it
# finds any matchen then only those specific files will be checked out (they
# will be restored to their state as of last branch out). (git check out parent
# branch)
alias gcopb='f() { gco $(git merge-base $(git branch | sed -n -e "s/^\* \(.*\)/\1/p") $(git log --decorate --simplify-by-decoration --oneline | grep -v "(HEAD" | head -n1 | sed "s/.* (\(.*\)) .*/\1/" | sed "s/,.*$//" | sed "s/origin\///")) -- $(git diff --name-only $(git branch | sed -n -e "s/^\* \(.*\)/\1/p") $(git merge-base $(git branch | sed -n -e "s/^\* \(.*\)/\1/p") $(git log --decorate --simplify-by-decoration --oneline | grep -v "(HEAD" | head -n1 | sed "s/.* (\(.*\)) .*/\1/" | sed "s/,.*$//" | sed "s/origin\///")) | grep $1)};f'

# Add files for staging based on a search term (git add grep)
alias gag='f() { git add $(git diff --name-only HEAD~1 | grep $1)};f'