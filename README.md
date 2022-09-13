### dotfiles

contains configuration for -

- vim
- oh my zsh
- tmux
- git

I use [GNU stow](https://www.gnu.org/software/stow/) to manage them.

```
git clone --recurse-submodules https://github.com/aishpant/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

Install one module:
```
stow vim
```
