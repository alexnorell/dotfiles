if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew reinstall \
    awscli \
    axel \
    balenaetcher \
    bartender \
    brave-browser \
    bruno \
    btop \
    claude-code \
    coreutils \
    curl \
    legcord \
    dive \
    font-caskaydia-cove-nerd-font \
    ffmpeg \
    fzf \
    gemini-cli \
    gh \
    git \
    gitingest \
    gnupg \
    go \
    goimports \
    golangci-lint \
    google-chrome \
    google-cloud-sdk \
    hex-fiend \
    hugo \
    imagemagick \
    iterm2 \
    lsd \
    dust \
    mkcert \
    n \
    nmap \
    opentofu \
    orbstack \
    pinentry-mac \
    pipx \
    powerlevel10k \
    prettier \
    pyenv \
    python@3.12 \
    rectangle-pro \
    rsync \
    rust \
    slack \
    sublime-merge \
    sublime-text \
    tio \
    tree \
    tuple \
    uv \
    visual-studio-code \
    vlc \
    wget \
    wireshark \
    ykman \
    zed \
    zoom \
    zoxide \
    zsh-autosuggestions \
