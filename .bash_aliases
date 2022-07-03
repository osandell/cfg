# Alias for working with the dotfiles repo. Just use "config" instead of "git"
alias shared-config='/usr/bin/git --git-dir=$HOME/.config-shared/ --work-tree=$HOME'
alias system-specific-config='/usr/bin/git --git-dir=$HOME/.config-system-specific/ --work-tree=/'

# Make an alternate version of the most common git aliases for the config repo
alias cgst='shared-config status'
alias cga='shared-config add'
alias cgaa='shared-config add -u'
alias cgcmsg='shared-config commit -m'
alias cgp='shared-config push'
alias cgpf!='shared-config push --force'
alias cgcan!='shared-config commit -v -a --no-edit --amend'
alias cgapa='shared-config add --patch'
alias cgloga='shared-config log --oneline --decorate --graph --all'

alias sgst='system-specific-config status'
alias sga='system-specific-config add'
alias sgaa='system-specific-config add -u'
alias sgcmsg='system-specific-config commit -m'
alias sgp='system-specific-config push'
alias sgpf!='system-specific-config push --force'
alias sgcan!='system-specific-config commit -v -a --no-edit --amend'
alias sgapa='system-specific-config add --patch'
alias sgloga='system-specific-config log --oneline --decorate --graph --all'

# Git and GitHub

# Get the names of the files that have been modified since previous commit (git
# diff previous commit)
alias gdnp='git diff --name-only HEAD~1'

# Get the names of the files that have been modified since last branch out. (git
# diff parent branch)
# TODO: Make it so it works without the origin branch being in sync
alias gdnpb='git diff --name-only $(git branch | sed -n -e "s/^\* \(.*\)/\1/p") $(git merge-base $(git branch | sed -n -e "s/^\* \(.*\)/\1/p") $(git log --decorate --simplify-by-decoration --oneline | grep -v "(HEAD" | head -n1 | sed "s/.* (\(.*\)) .*/\1/" | sed "s/,.*$//" | sed "s/origin\///"))'

# Check out the commit at last branch out. Takes an argument that will be
# matched against all filenames of modified files since last branch out. If it
# finds any match then only those specific files will be checked out (they
# will be restored to their state as of last branch out). (git check out parent
# branch)
alias gcopb='f() { gco $(git merge-base $(git branch | sed -n -e "s/^\* \(.*\)/\1/p") $(git log --decorate --simplify-by-decoration --oneline | grep -v "(HEAD" | head -n1 | sed "s/.* (\(.*\)) .*/\1/" | sed "s/,.*$//" | sed "s/origin\///")) -- $(git diff --name-only $(git branch | sed -n -e "s/^\* \(.*\)/\1/p") $(git merge-base $(git branch | sed -n -e "s/^\* \(.*\)/\1/p") $(git log --decorate --simplify-by-decoration --oneline | grep -v "(HEAD" | head -n1 | sed "s/.* (\(.*\)) .*/\1/" | sed "s/,.*$//" | sed "s/origin\///")) | grep $1)};f'

# Add files for staging based on a search term (git add grep)
alias gag='f() { git add $(git diff --name-only HEAD~1 | grep $1)};f'

# Open all files modified since last branchout (git open modified)
alias gom='for i in $(git diff --name-only $(git branch | sed -n -e "s/^\* \(.*\)/\1/p") $(git merge-base $(git branch | sed -n -e "s/^\* \(.*\)/\1/p") $(git log --decorate --simplify-by-decoration --oneline | grep -v "(HEAD" | head -n1 | sed "s/.* (\(.*\)) .*/\1/" | sed "s/,.*$//" | sed "s/origin\///"))); code "$i"'

# Open files modified since last branchout based on a search term (git open modified grep)
alias gomg='f() {for i in $(git diff --name-only $(git branch | sed -n -e "s/^\* \(.*\)/\1/p") $(git merge-base $(git branch | sed -n -e "s/^\* \(.*\)/\1/p") $(git log --decorate --simplify-by-decoration --oneline | grep -v "(HEAD" | head -n1 | sed "s/.* (\(.*\)) .*/\1/" | sed "s/,.*$//" | sed "s/origin\///")) | grep $1); code "$i"};f'

# Same as alias gclean but without interactive
alias gclean!='git clean -f -d'

# Remove all content except .git and then make a hard reset
alias gcleanreset!='git rm -rf . && git clean -fxd && git reset --hard && yarn'

