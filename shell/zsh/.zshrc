HISTFILE="$HOME/.zhistory"       # History filepath
HISTSIZE=10000                   # Maximum events for internal history
SAVEHIST=10000                   # Maximum events in history file

# A nice custom prompt, but I use starship!
# autoload -Uz vcs_info
# precmd_vcs_info() { vcs_info }
# precmd_functions+=( precmd_vcs_info )
# setopt prompt_subst
# zstyle ':vcs_info:git:*' formats '%F{yellow}%K{yellow}%F{black}  %b %K{reset}%F{reset}'
# PROMPT='%K{blue}%F{black} %1~ %K{reset}%F{blue}%K{reset}%F{reset} '
# RPROMPT='$vcs_info_msg_0_'

setopt AUTO_CD                   # Go to folder path without using cd.
setopt AUTO_PUSHD                # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS         # Do not store duplicates in the stack.
setopt PUSHD_SILENT              # Do not print the directory stack after pushd or popd.
setopt CORRECT                   # Spelling correction

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

source "$HOME/.aliases"

# starship prompt
eval "$(starship init zsh)"

# pyenv
eval "$(pyenv init -)"

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# skim
[ -f ~/.skim/shell/completion.zsh ] && source ~/.skim/shell/completion.zsh
[ -f ~/.skim/shell/key-bindings.zsh ] && source ~/.skim/shell/key-bindings.zsh

# zsh-history-substring-search
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
