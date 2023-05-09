alias ls=lsd
alias cat=bat
alias p=pnpm
alias px=pnpx

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

