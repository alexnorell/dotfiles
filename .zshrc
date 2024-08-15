# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Dotfiles git setup
if [ -d "$HOME/.dotfiles" ]; then
    alias gdf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
fi

# OS set up
case "$OSTYPE" in
    darwin*)
        export PATH="$PATH:${HOME}/.local/bin"
        brew_install="/opt/homebrew/bin/brew"
        if test -f "$brew_install"; then
            eval "$($brew_install shellenv)"
        else
            echo "Brew not found at $brew_install. Install it from https://brew.sh"
        fi
        iterm_integration="${HOME}/.iterm2_shell_integration.zsh"
        if test -f "$iterm_integration" ; then
            source "$iterm_integration"
        fi
        if command -v orb &> /dev/null; then
            source ~/.orbstack/shell/init.zsh 2>/dev/null || :
        fi
        autosuggestions="$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
        if test -f "$autosuggestions"; then
            source "$autosuggestions"
        fi
        powerlevel10k="$(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme"
        if test -f "$powerlevel10k"; then
            source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme
        fi
    ;;
esac

if command -v gpg &> /dev/null; then
    export GPG_TTY=$(tty)
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
    gpgconf --launch gpg-agent
fi

if command -v zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
    # Alias cd to zoxide
    alias cd='z'
fi

if command -v fzf &> /dev/null; then
    source <(fzf --zsh)
fi

if command -v lsd &> /dev/null; then
    # Alias ls to lsd
    alias ls='lsd'
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
