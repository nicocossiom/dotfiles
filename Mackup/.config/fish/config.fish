alias ls=lsd
alias cat=bat
alias top=btm
alias htop=btm
alias find=fd
alias p=pnpm
alias px=pnpx
alias fd=dust

fish_ssh_agent

# rbenv setup
status --is-interactive; and rbenv init - fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/pepperonico/mambaforge/bin/conda
    eval /Users/pepperonico/mambaforge/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

# ohmpyposh theme
source ~/.config/fish/functions/oh-my-posh.fish
# z jump
zoxide init fish | source