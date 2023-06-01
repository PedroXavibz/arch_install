alias cl='clear'
alias e='exit'

alias ..='cd ..'
alias imgs='cd ~/Imagens/'
alias src='cd ~/src'
alias scripts='cd ~/scripts'
alias music='cd ~/Música'
alias docs='cd ~/Documentos'
alias dev='cd ~/Dev'
alias cf='cd ~/.config'
alias etc='cd /etc'

alias ls="ls --color"
alias la="ls -A"

alias ll="ls -l"
alias lla="ll -A"

alias le='exa -l --icons -h -@ --color-scale'
alias lea='le -a'

alias tree='tree -C'

alias s='sudo'
# alias sp='sudo pacman'
# alias update_mirrors='reflector --sort rate -l 5 --save /etc/pacman.d/mirrorlist'
alias apt-sear='apt search'
alias apt-up='sudo apt update && sudo apt upgrade -y'
alias apt-inst='sudo apt install -y'

alias mt='sudo mount'
alias umt='sudo umount'

alias nv='nvim'
alias vi='vim'

alias chatgpt='chatgpt_rust'

alias rg='ranger .'
alias srg='sudo ranger .'

alias ufw='sudo ufw'

alias ntpd='sudo ntpd -qg'

alias mac='sudo macchanger'

alias rmm='shred -v -u -z -n'
alias srmm='sudo shred -v -u -z -n'

alias dot='/usr/bin/git --git-dir="$HOME/.dotfiles" --work-tree="$HOME"'

alias tm-init='transmission-daemon'
alias tm='transmission-remote'

#-_-_-_-_--_-_-_-_- [KEYBINDS] -_-_-_-_--_-_-_-_-
# bind -x '"\C-o":". finder"'

#-_-_-_-_--_-_-_-_- [CODE DEVELOPMENT JS] -_-_-_-_--_-_-_-_-
alias yarn-create='yarn create react-app'
alias yarn-lint='yarn add eslint --dev && yarn create @eslint/config'

#-_-_-_-_--_-_-_-_- [GIT] -_-_-_-_--_-_-_-_-
alias g-init='git init'
alias g-add='git add'
alias g-commit='git commit -m'
alias g-status='git status'
alias g-log='git log'
alias g-show='git show'
alias g-add-repo='git remote add origin'
alias g-show-repo='git remote -v'
alias g-push='git push'
alias g-clone='git clone'
alias g-pull='git pull'
alias g-restore='git restore'

alias bran-create='git branch'
alias bran-change='git checkout'
alias bran-merge='git merge'
alias bran-remove='git branch -D'
alias bran-show='git branch -a'
alias bran-show-remote='git branch -r'

#-_-_-_-_--_-_-_-_- [YT-DLP] -_-_-_-_--_-_-_-_-
alias yt-mp3='yt-dlp -f "ba" -x --audio-format mp3 --embed-thumbnail'
alias yt-mp4='yt-dlp -f mp4 --embed-thumbnail'
