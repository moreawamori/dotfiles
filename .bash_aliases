if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# some more aliases
alias nvim="$HOME/bin/nvim/nvim.appimage"
alias vim='nvim'
alias du='du -c -h'
alias du1='du --max-depth=1'
alias hist='history | greo'
alias pstree='ps awwfux | less -S'

# alias for exa
if [[ $(command -v exa) ]]; then
    alias e='exa --icons'
    alias l=e
    alias ls=e
    alias ea='exa -a --icons'
    alias la=ea
    alias ee='exa -aal --icons'
    alias ll=ee
    alias et='exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'
    alias lt=et
    alias eta='exa -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
    alias lta=eta
fi

if [[ $(command -v btm) ]]; then
    alias btm='btm --color nord'
fi
