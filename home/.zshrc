# Workaround against starting percentage sign before the PS1
unsetopt PROMPT_SP
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it

# History, default settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=2000
bindkey -e

#color and content of the PS1 prompt in zsh
autoload -U colors && colors
TERM="xterm-256color"
#simple ps1
#PS1="%{$fg[yellow]%}%n@%m %{$fg[magenta]%}%~ :  %{$reset_color%}% "

# Longer one with date and hostname, but no line break
PS1='%B%F{243}%D{%d-%m-%Y}/%B%F{243}%* %B%F{166}%n@%m %B%F{12}%~%B%F{12}: %b%F{reset}'

# highlighting of selected menu itmes when using autocomplete
zstyle ':completion:*' menu select
autoload -U compinit && compinit

# use bash style word selection, honoring / and -
autoload -U select-word-style
select-word-style bash

# my favorite aliases
alias ls="ls --color=always"
alias ll="ls -la1"
alias grep="grep --color=always"
alias testssl="~/Repos/testssl.sh/testssl.sh --openssl /usr/bin/openssl"
alias nmap-fast="sudo nmap -sS -A -Pn -p-"
alias testssl-update="current_dir=$(pwd); if [[ ! -d ~/Repos/testssl.sh ]]; then cd ~/Repos && git clone https://github.com/drwetter/testssl.sh.git; else cd ~/Repos/testssl.sh && git pull; fi; cd ${current_dir}"
alias apm-backup="apm list --installed --bare > ~/.atom/package.list"

# Keybindings, pretty self explanatory
# If one keybinding behaves unexpected, use ctrl+v or cat -v to investigate
bindkey	"^[[3~" delete-char
bindkey	"^[[1;5C"	forward-word
bindkey	"^[[1;5D"	backward-word
if [[ $(uname -rv) =~ "kali" ]]; then 
  if [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]]; then
    bindkey '^H'  backward-kill-word
  else;
    bindkey '^?'  backward-kill-word
  fi
else;
  bindkey '^H'  backward-kill-word
fi
bindkey '5~'  kill-word

#Install additonal plugins, uncomment to use 
# ATTENTION: Check the correct location beforehand

#Suggest entries from the zsh history for autocomplete
if [[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Highlight valid entries and syntax
if [[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
fi


