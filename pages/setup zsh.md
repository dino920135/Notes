public:: true
title:: setup zsh
#zsh #code

- Reference from [leovincentseles/zsh-config](https://github.com/leovincentseles/zsh-config) by [leovincentseles](https://github.com/leovincentseles)
- ## Installation
	- ### zsh
	  ```bash
	  sudo apt-get install zsh
	  ```
	- ### [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
	  ```bash
	  git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
	  ```
	- ### [theme Powerlevel10k](https://github.com/romkatv/powerlevel10k)
	  ```bash
	  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
	  ```
	- ### [theme nctu (by leovincentseles)](https://github.com/leovincentseles/nctu.zsh-theme)
	  ```bash
	  git clone --depth=1 https://github.com/leovincentseles/nctu.zsh-theme.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/leovincentseles
	  ```
	- ### [zsh-autosuggestion](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)
	  ```bash
	  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	  ```
	- ### Use zsh-config from leovincentseles(Optional)
	  ```bash
	  git clone https://github.com/leovincentseles/zsh-config
	  cd zsh-config
	  rm -rf images README.md .git
	  cd ..
	  cp -a zsh-config/. ~/
	  rm -rf zsh-config
	  ```
	  Change the user name in _~/.zshrc_ file on this line
	  `export ZSH="/home/YOUR_USER_NAME/.oh-my-zsh"`
- ## Change Font (Important)
  Some themes cannot be display correctly with normal  fonts
	- ### Fonts
		- [Sauce Code Pro Nerd](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/SourceCodePro/Regular/complete)
- ## Start
	- ### Enter zsh
	  ```bash
	  zsh
	  ```
	  Or add `zsh` to _~/.bashrc_
	- ### Exit zsh
	  **Ctrl+D**