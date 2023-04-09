############# Main commands #############

all: zsh directory autokey ulauncher kitty neofeth background themes

looks: zsh kitty tmux themes neofetch

rm: clean uninstall

############# Dependencies #############

check-git:
	sudo apt-get install -y git

check-pip:
	sudo apt-get install -y python3-pip

check-wget:
	sudo apt-get install -y wget

############# Installers #############

zsh: check-git
	sudo apt-get install -y zsh
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	cp -r zsh ~/.config/
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	chsh -s $(which zsh) 

directory:
	mkdir -p $(HOME)/Documents/Trabajo $(HOME)/Documents/Proyectos

kitty:
	curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
	cp -r kitty ~/.config/

tmux: check-git
	git clone https://github.com/gpakosz/.tmux.git
	ln -s -f .tmux/.tmux.conf
	cp .tmux/.tmux.conf.local .

neofeth:
	sudo apt-get install -y neofetch
	cp -r neofetch ~/.config/

background: check-git
	git clone https://github.com/ghostlexly/gpu-video-wallpaper.git
	cd gpu-video-wallpaper && ./install.sh

themes:
	$(HOME)/.icons $(HOME)/.themes
	sudo apt-add-repository universe
	sudo apt-get install -y gnome-tweaks gnome-shell-extensions gnome-shell-extension-manager
	mkdir -p ./themes/ready2install
	chmod +x ./install-themes.sh
	./install-themes.sh

autokey: check-pip check-wget
	wget https://github.com/autokey/autokey/releases/download/v0.96.0/autokey-common_0.96.0_all.deb
	sudo dpkg -i autokey-common_0.96.0_all.deb

ulauncher:
	sudo add-apt-repository ppa:agornostal/ulauncher
	sudo apt-get update
	sudo apt-get install -y ulauncher
	cp -r ulauncher/* ~/.config/ulauncher/

############# Cleaners #############	

clean:
	rm -rf .tmux
	rm .tmux.conf
	rm .tmux.conf.local
	rm -rf gpu-video-wallpaper
	rm -rf autokey-common_0.96.0_all.deb
	rm -rf themes/ready2install
	rm -rf ~/.config/kitty
	rm -rf ~/.config/zsh
	rm -rf ~/.config/neofetch
	rm -rf ~/.config/ulauncher
	rm -rf ~/.fzf
	rm -rf ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	rm -rf ~/.icons
	rm -rf ~/.themes

uninstall:
	sudo apt-get remove -y zsh kitty fonts-powerline neofetch autokey-common ulauncher
	sudo apt-get remove -y gnome-tweaks gnome-shell-extensions gnome-shell-extension-manager
	sudo apt-get remove -y fontconfig wget python3-pip
	sudo apt-get remove -y zsh-common libc6 libcap2 libtinfo6
	sudo apt-get remove -y kitty-terminfo python3 python3.10 libc6 libdbus-1-3 libfontconfig1 libfreetype6 libharfbuzz0b liblcms2-2 libpng16-16 libpython3.10 libwayland-client0 libx11-6 libx11-xcb1 libxkbcommon-x11-0 libxkbcommon0 zlib1g
	sudo apt-get remove -y libc6 libevent-core-2.1-7 libtinfo6 libutempter0
	sudo apt-get autoremove -y