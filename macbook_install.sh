if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew install \
    arc \
    awscli \
    bartender \
    brave-browser \
    bruno \
    btop \
    coreutils \
    coreutils \
    curl \
    discord \
    dive \
    font-caskaydia-cove-nerd-font \
    fzf \
    gh \
    git \
    gnupg \
    google-chrome \
    google-cloud-sdk \
    google-cloud-sdk \
    hex-fiend \
    hugo \
    imagemagick \
    iterm2 \
    lsd \
    mkcert \
    nmap \
    opentofu \
    orbstack \
    pinentry-mac \
    pipx \
    powerlevel10k \
    pyenv \
    python@3.12 \
    rectangle-pro \
    rsync \
    slack\
    sublime-merge \
    sublime-text \
    visual-studio-code \
    vlc \
    wget \
    wireshark \
    ykman \
    zed \
    zoom \
    zoxide \
    zsh-autosuggestions \

brew tap hashicorp/tap
brew install hashicorp/tap/terraform
