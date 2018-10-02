
.DEFAULT_GOAL := help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST)  | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

all: ## create bin,pkg,src and deploy all dotfiles
	[ -d ~/bin] || mkdir -p ~/bin
	[ -d ~/pkg] || mkdir -p ~/pkg
	[ -d ~/src] || mkdir -p ~/src
	[ -f ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc
	[ -f ~/.zshrc ] || ln -s $(PWD)/zshrc ~/.zshrc

clean: ## clean dotfiles
	[ -f ~/.vimrc ] && rm ~/.vimrc
	[ -f ~/.zshrc ] && rm ~/.zshrc

brew: ## setup homebrew via Brewfile
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew bundle cleanup
	brew bundle

vim: ## install plug.vim
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

shell: ## setup zsh as default shell
	sudo sh -c "grep -q '/usr/local/bin/zsh' /etc/shells || echo '/usr/local/bin/zsh' >> /etc/shells"
	sudo chsh -s /usr/local/bin/zsh

.PHONY: all
