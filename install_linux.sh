#!/bin/bash

echo "Link dotfiles..."
if [ -f $HOME/dotfiles/.bash_profile ];then
    echo ".bash_profile"
    if [ -f $HOME/.bash_profile ];then
        rm -i ~/.bash_profile
    fi
    ln -s $HOME/dotfiles/.bash_profile $HOME/.bash_profile
    source $HOME/.bash_profile
fi

if [ -f $HOME/dotfiles/.bashrc ];then
    echo ".bashrc"
    if [ -f $HOME/.bashrc ];then
        rm -i ~/.bashrc
    fi
    ln -s $HOME/dotfiles/.bashrc $HOME/.bashrc
    source $HOME/.bashrc
fi

if [ -f $HOME/dotfiles/.bash_aliases ];then
    echo ".bash_aliases"
    if [ -f $HOME/.bash_aliases ];then
        rm -i ~/.bash_aliases
    fi
    ln -s $HOME/dotfiles/.bash_aliases $HOME/.bash_aliases
    source $HOME/.bash_aliases
fi

if [ -f $HOME/dotfiles/vimrc ];then
    echo "vimrc to ~/.vimrc and ~/.config/nvim/init.vim"
    if [ -f $HOME/.vimrc ];then
        rm  -i ~/.vimrc
    fi
    ln -s $HOME/dotfiles/vimrc $HOME/.vimrc

    mkdir -p $HOME/.config/nvim/
    ln -s $HOME/dotfiles/vimrc $HOME/.config/nvim/init.vim
fi

if [ -d $HOME/dotfiles/vim ];then
    echo "vim to $HOME/.vim"
    if [ -d $HOME/.vim ];then
        echo "remove ~/.vim"
        rm -fr $HOME/.vim
    fi
    ln -s $HOME/dotfiles/vim $HOME/.vim
fi

echo "...Link dotfiles Completed"

echo "Install neovim..."
mkdir -p ~/bin/nvim/
cd ~/bin/nvim/
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
cd ~/dotfiles

echo "...Installed neovim"
echo "Install For Vim and neovim..."

if [[ ! $(command -v deno) ]]; then
    echo "deno"
    echo "Install Deno..."
    cd ~
    curl -fsSL https://deno.land/install.sh | sh
    if [ -f ~/.bashrc ];then
        if [ $DENO_INSTALL != $HOME/.deno ]; then
            touch ~/.extrapathes
            echo 'export DENO_INSTALL="$HOME/.deno' >> ~/.extrapathes
            echo 'export PATH="$DENO_INSTALL/bin:$PATH"' >> ~/.extrapathes
        fi
    fi
    echo "...Installed Deno"
    cd ~/dotfiles
fi

if [[ ! $(command -v cargo) ]]; then
    echo "Install Rust..."
    curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
    rustup update
fi
source $HOME/.cargo/env

echo "Install tools..."
cargo install ripgrep
cargo install exa
cargo install fd
cargo install cargo-update
# cargo install bottom

source ~/.bash_profile
