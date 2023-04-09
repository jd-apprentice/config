all: zsh directory autokey ulauncher kitty neofeth background themes

looks: kitty tmux directory themes background

zsh:
	sudo apt-get install -y zsh
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	cp -r zsh ~/.config/
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

directory:
	mkdir -p $(HOME)/Documents/Trabajo $(HOME)/Documents/Proyectos $(HOME)/.icons $(HOME)/.themes

autokey:
	sudo apt-get install -y python3-pip wget
	wget https://github.com/autokey/autokey/releases/download/v0.96.0/autokey-common_0.96.0_all.deb
	sudo dpkg -i autokey-common_0.96.0_all.deb

ulauncher:
	sudo add-apt-repository ppa:agornostal/ulauncher
	sudo apt-get update
	sudo apt-get install -y ulauncher
	cp -r ulauncher/* ~/.config/ulauncher/

kitty:
	sudo apt-get install -y kitty fonts-powerline
	cp -r kitty ~/.config/

tmux:
	git clone https://github.com/gpakosz/.tmux.git
	ln -s -f .tmux/.tmux.conf
	cp .tmux/.tmux.conf.local .

neofeth:
	sudo apt-get install -y neofetch
	cp -r neofetch ~/.config/

background:
	sudo apt-get install -y git-all
	git clone https://github.com/ghostlexly/gpu-video-wallpaper.git
	cd gpu-video-wallpaper && ./install.sh

themes:
	sudo apt-add-repository universe
	sudo apt-get install -y gnome-tweaks gnome-shell-extensions gnome-shell-extension-manager
	mkdir -p ./themes/ready2install
	chmod +x ./install-themes.sh
	./install-themes.sh
