function ssh-ip() {
    ssh -G $1 | awk '/^hostname / { print $2 }'
}

function yfile() {
    cat "$1" | xclip -sel c
}

function pfile() {
    xclip -sel c -o > "$1"
}

export CLANGD_FLAGS="--query-driver=/usr/bin/c++"

export TERM=xterm-256color
export EDITOR=nvim

alias cat=batcat
alias vim=nvim
