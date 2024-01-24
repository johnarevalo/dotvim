Installation

    git clone https://github.com/johnarevalo/dotvim.git ~/.vim/
    cd ~/.vim
    git submodule update --init --recursive

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc

Update all submodules:

    cd ~/.vim
    git submodule update --remote


Install LSP python:

    mamba install python-lsp-server python-lsp-ruff rope yapf
