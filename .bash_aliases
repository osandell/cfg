# Alias for working with the dotfiles repo. Just use "config" instead of "git"
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Git and GitHub

# git diff previous commit
alias gdfp='git diff --name-only HEAD~1'

# git diff parent branch
alias gdfpb="git diff --name-only $(git branch | sed -n -e 's/^\* \(.*\)/\1/p') $(git merge-base $(git branch | sed -n -e 's/^\* \(.*\)/\1/p') $(git log --decorate --simplify-by-decoration --oneline | grep -v "(HEAD" | head -n1 | sed 's/.* (\(.*\)) .*/\1/' | sed 's/,.*$//' | sed 's/origin\///'))"