# Dotfiles

A collection of configuration files for ~nix systems.

## Install

```sh
curl -Lks https://norell.link/dotfiles | /bin/zsh
```

OR

```sh
#!/bin/zsh
git clone --bare https://github.com/alexnorell/dotfiles.git $HOME/.dotfiles
alias gdf="git --git-dir=$HOME/.dotfiles/"
gdf config --local status.showUntrackedFiles no
mkdir -p .config-backup && \
gdf checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
gdf checkout
```
