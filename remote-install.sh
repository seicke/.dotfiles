#!/usr/bin/env bash

echo "🚀 Starting .dotfiles setup..."

SOURCE="https://github.com/seicke/.dotfiles"
TARBALL="$SOURCE/tarball/main"
TARGET="$HOME/.dotfiles"
TAR_CMD="tar -xzv -C "$TARGET" --strip-components=1 --exclude='{.gitignore}'"

is_executable() {
  type "$1" > /dev/null 2>&1
}

if [ -d "$FOLDER_PATH" ]; then
    git pull
else
  if is_executable "git"; then
    CMD="git clone $SOURCE $TARGET"
  elif is_executable "curl"; then
    CMD="curl -#L $TARBALL | $TAR_CMD"
  elif is_executable "wget"; then
    CMD="wget --no-check-certificate -O - $TARBALL | $TAR_CMD"
  fi

  if [ -z "$CMD" ]; then
    echo "❌ No git, curl or wget available. Aborting."
  else
    echo "📥 Downloading .dotfiles..."
    mkdir -p "$TARGET"
    eval "$CMD"
  fi
fi

if [[ "$(uname)" == "Darwin" ]]; then
  source ~/.dotfiles/scripts/install/macOS/install.sh
fi