# YubiKey GPG & SSH Agent Forwarding (macOS to Linux)

Forward your YubiKey's GPG signing and SSH auth keys to remote Linux systems over SSH.

## Prerequisites

**macOS:**
- GPG with YubiKey configured
- `~/.gnupg/gpg-agent.conf`:
  ```
  pinentry-program /opt/homebrew/bin/pinentry-mac
  enable-ssh-support
  ```
- `SSH_AUTH_SOCK` pointing to gpg-agent: `export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)`

## macOS SSH Config

Add to `~/.ssh/config`:

```
Host remote-host
  HostName <hostname-or-ip>
  User <username>
  RemoteForward /run/user/1000/gnupg/S.gpg-agent /Users/<you>/.gnupg/S.gpg-agent.extra
  StreamLocalBindUnlink yes
  ControlMaster auto
  ControlPath ~/.ssh/sockets/%r@%h-%p
  ControlPersist 600
  ForwardAgent yes
```

Create the sockets directory: `mkdir -p ~/.ssh/sockets && chmod 700 ~/.ssh/sockets`

**Note:** Adjust `/run/user/1000/gnupg/S.gpg-agent` to match `gpgconf --list-dirs agent-socket` on the remote.

## Remote Linux Setup

Disable systemd's gpg-agent (it conflicts with forwarding):

```bash
systemctl --user mask gpg-agent.socket gpg-agent.service
gpgconf --kill gpg-agent
```

Configure git signing:

```bash
git config --global commit.gpgsign true
git config --global user.signingkey <YOUR_KEY_ID>
```

## Usage

If you get "remote port forwarding failed", clean up stale sockets first:

```bash
ssh -F /dev/null user@remote-host "rm -f /run/user/1000/gnupg/S.gpg-agent"
```

Then connect normally:

```bash
ssh remote-host
```

## What Works

- **GPG signing** (git commits, etc.) - PIN prompt appears on macOS
- **SSH agent** - hop to other hosts using YubiKey auth key

## What Doesn't Work

- `gpg --card-status` - blocked by extra socket restrictions (signing still works)
