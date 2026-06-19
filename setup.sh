#!/bin/sh

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
ln -sfn "$SCRIPT_DIR/.cext" "$HOME/.cext"
. "$SCRIPT_DIR/scripts/edit-region.sh"

# MARK: setup zshrc
ZSHRC="$HOME/.zshrc"
touch "$ZSHRC"

update_managed_region "$ZSHRC" "#" <<EOF
. "$HOME/.cext/.zsh-ext"
EOF

# MARK: setup vim
ln -sfn "$SCRIPT_DIR/.vim" "$HOME/.vim"
if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
  curl \
    -fLo \
    "$HOME/.vim/autoload/plug.vim" \
   --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

VIMRC="$HOME/.vimrc"
touch "$VIMRC"
update_managed_region "$VIMRC" "\"" <<EOF
source $HOME/.cext/.vim-ext
EOF

vim +PlugUpdate +qall

# MARK: setup screen
ln -sfn "$SCRIPT_DIR/.screenrc" "$HOME/.screenrc"

# MARK: setup git
git config --global core.excludesFile "$HOME/.cext/.gitignore-ext"
