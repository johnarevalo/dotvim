Installation

    git clone https://github.com/johnarevalo/dotvim.git ~/.vim/
    cd ~/.vim
    git submodule update --init

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc

Update all submodules:

    cd ~/.vim
    git submodule foreach git pull origin master
