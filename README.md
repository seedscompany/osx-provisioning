# os-x setup

## via make

### dotfiles

*customize* vim/zshrc if you use them

```
make all
```

### brew

install tools via homebrew, Brewfile

```
make brew
```

### vim

setup [vim-plug](https://github.com/junegunn/vim-plug)

```
make vim
```

## extra steps

### docker

install manually docker for mac version 17 via [docker-for-mac release-notes](https://docs.docker.com/docker-for-mac/release-notes/)

### golang

install specific version of golang

```
goenv install 1.11.4
```

### terraform

install version 0.8.4 of terraform

```
tfenv install 0.8.4
```
