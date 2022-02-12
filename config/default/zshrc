# Workaround against starting percentage sign before the PS1
unsetopt PROMPT_SP
# delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_expire_dups_first
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
PS1=$'%B%F{166}%d%f%b\n%F{243}%n@%M%f%(!. %B%F{red}#%b%f.%F{243}:%f)%f '
RPROMPT='%(?.%B%F{green}√%b%f.%B%F{red}✗%b%?%f)'
# highlighting of selected menu itmes when using autocomplete
zstyle ':completion:*' menu select
autoload -U compinit && compinit

# use bash style word selection, honoring / and -
autoload -U select-word-style
select-word-style bash

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

if [[ -f "$HOME/.aliases" ]]; then
source $HOME/.aliases
fi
if [[ -f "$HOME/.local-aliases" ]]; then
source $HOME/.local-aliases
fi
if [[ -h "$HOME/.zsh-functions" ]]; then
  for func in $HOME/.zsh-functions/*; do
  source $func;
  done
fi

umask 0027

PATH+=":${HOME}/.local/bin"
