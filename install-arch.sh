# Intro Message
echo "Do not run as sudo! Press Ctrl+C to exit" 
read DUD

### 
### Install programs
### 
echo "Installing programs..."
sleep 1
sudo pacman -Syu

# Install terminal programs
sudo pacman -S bat fzf curl tmux python3

# Install 'colored-man-pages' dependencies
sudo pacman -S autojump zsh-syntax-higlighting zsh-autosuggestions neovim \
cpanminus logiops

# Enable/start services
sudo systemctl enable logid
sudo systemctl start logid

# Neovim - LSP Support
python3 -m pip install --user --upgrade pynvim				# Python3
sudo npm install -g neovim									# Node JS
sudo cpanm -n Neovim::Ext									# Perl
export PATH="$PATH:$(rube -e 'puts Gem.user_dir')/bin" \	
&& gem list && gem update && gem install neovim				# Ruby

# Neovim - Plugin Mgr (vim-plug)
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Link saves Zelda
ln -sf $PWD/home/.* $HOME/.*						# Git, TMUX, ZSh*
ln -sf $PWD/home/.config/nvim $HOME/.config/nvim	# NVim
ln -sf $PWD/home/etc/logid.cfg $HOME/etc/logid.cfg	# LogIOps


# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "Downloading Powerlevel10k Fonts..."
sleep 1
FONT_DIR="/usr/share/fonts/MesloLGS NF"
sudo mkdir $FONT_DIR
sudo curl -o $FONT_DIR/MesloLGS\ NF\ Regular.ttf \
    "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"
sudo curl -o $FONT_DIR/MesloLGS\ NF\ Bold.ttf \
    "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf"
sudo curl -o $FONT_DIR/MesloLGS\ NF\ Italic.ttf \
    "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf"
sudo curl -o $FONT_DIR/MesloLGS\ NF\ Bold\ Italic.ttf \
    "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"
echo "Installing fonts..."
sleep 1
fc-cache -v -f /usr/share/fonts

# YouCompleteMe
#sudo pacman -S build-essential cmake python3-dev -y
#sudo pacman -S mono-complete golang nodejs openjdk-17-jdk openjdk-17-jre npm -y
#python3 $HOME/.config/nvim/plugged/YouCompleteMe/install.py --all

# Install Vim plugins
echo "An install error may occur for FZF and Treesitter"
sleep 1
echo "Just re-open terminal and run :PlugInstall to verify success."
sleep 1
echo "Press enter to exit..." 
read DUD
nvim -c PlugInstall -c qa!

# End User Message
echo "Apply MesloLGS NF Regular font to terminal preferences"
echo "Reboot shell for changes to take effect."
