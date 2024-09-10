/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

brew install \
    awscli \
    bartender \
    brave-browser \
    btop \
    coreutils \
    coreutils \
    curl \
    discord \
    font-caskaydia-cove-nerd-font \
    fzf \
    gcloud \
    gh \
    git \
    gnupg \
    google-chrome \
    google-cloud-sdk \
    hex-fiend \
    hugo \
    imagemagick \
    iterm2 \
    lsd \
    nmap \
    opentofu \
    orbstack \
    pinentry-mac \
    pipx \
    pyenv \
    python@3.12 \
    rectangle-pro \
    rsync \
    sublime-merge \
    sublime-text \
    vlc \
    wget \
    wireshark \
    ykman \
    zed \
    zoom \
    zoxide \
    zsh-autosuggestions \


git clone --bare https://github.com/alexnorell/dotfiles.git $HOME/.dotfiles
alias gdf="git --git-dir=$HOME/.dotfiles/"
gdf config --local status.showUntrackedFiles no
mkdir -p .config-backup && \
gdf checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
gdf checkout
