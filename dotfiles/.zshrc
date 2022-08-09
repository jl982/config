# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/code/zmisc/powerlevel10k/powerlevel10k.zsh-theme

export PATH=/opt/homebrew/bin:/usr/local/mysql/bin/:$PATH
#echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'

export HISTSIZE=10000000
export SAVEHIST=10000000

bindkey \^U backward-kill-line

autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line

alias ls='ls --color'
alias l='ls'
alias ll='ls -l'

alias g='git status'
alias ga='git add'
alias gb='git branch'
alias gco='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log'
alias gs='git status'
alias gcos='git checkout src/server/graphql/schema.graphql'

alias pq='psql -U postgres'
alias rg='rg -i'
alias gen='yarn generate'
alias gent='yarn generate && yarn typecheck'
alias dbp='npx prisma db push'

dbps() {
    output=$(npx prisma db push $1)
    echo $output
    sync_already=$(echo $output | grep -o 'already in sync')
    if [ -z "$sync_already" ]; then
        sync_now=$(echo $output | grep -o 'now in sync')
        if [ -z "$sync_now" ]; then
            echo "Resolve schema conflict"
        else
            echo "Restarting Prisma Studio"
            pkill -f 'yarn prisma studio'
            yarn prisma studio &
        fi
    else
        echo "Not restarting Prisma Studio"
    fi
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH=/usr/local/mysql/bin/:$PATH
