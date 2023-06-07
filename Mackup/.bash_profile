# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/bash_profile.pre.bash" ]] && builtin source "$HOME/.fig/shell/bash_profile.pre.bash"
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/pepperonico/mambaforge/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/pepperonico/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/Users/pepperonico/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/Users/pepperonico/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/pepperonico/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/Users/pepperonico/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/bash_profile.post.bash" ]] && builtin source "$HOME/.fig/shell/bash_profile.post.bash"
