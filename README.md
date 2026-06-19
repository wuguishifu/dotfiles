# Dotfiles

This is a collection of dotfiles that I use. Configurations currently included are:

- vim
- git
- zsh
- screen
- vscode

To install, run the `setup.sh` script. This will create a symlink for the `.cext` dir and add managed regions to your `.zshrc` and `.vimrc` files sourcing the extensions.

Managed regions will look something like this:

```sh
# MANAGED BY wuguishifu/dotfiles START
...
# MANAGED BY wuguishifu/dotfiles END
```

As long as the start and end comment are unchanged, the `setup.sh` script is idempotent and can be ran if any updates are needed.
