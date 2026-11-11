#!/bin/bash

# ==============================================================================
# macOS (Apple Silicon / Intel)
# ==============================================================================
# Requires Homebrew: https://brew.sh

install_macos() {
    # ctags — macOS ships BSD ctags which is incompatible with Tagbar/indexer.
    # universal-ctags is the actively maintained Exuberant Ctags fork.
    brew install universal-ctags

    # Make sure Homebrew's bin comes before /usr/bin so `ctags` resolves correctly.
    # Add the following line to ~/.zshrc if `which ctags` still shows /usr/bin/ctags:
    #   export PATH="/opt/homebrew/bin:$PATH"

    # vim with Python3 support (macOS system vim lacks it)
    brew install vim

    # Install Vundle plugin manager
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    # jedi: Python semantic analysis backend for jedi-vim
    pip3 install jedi

    # Node.js is required by coc.nvim — check with: node --version
    # If missing: brew install node

    # Install Vundle plugin manager
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    # rust-analyzer: Rust LSP server for coc-rust-analyzer
    brew install rust-analyzer

    # Copy coc-settings.json to ~/.vim/
    cp coc-settings.json ~/.vim/coc-settings.json

    # After copying .vimrc, open vim and run:
    #   :PluginInstall
    # Then install coc extensions (Python + Rust LSP) inside vim:
    #   :CocInstall coc-pyright coc-rust-analyzer
}

# ==============================================================================
# Linux (CentOS / RHEL)
# ==============================================================================

install_linux() {
    git clone https://github.com/vim/vim.git

    yum install ctags-etags
    yum install ncurses-devel.x86_64
    yum install perl-ExtUtils*
    yum install boost-devel
    yum install clang llvm-devel
    yum install gcc-c++
    yum install boost
    yum install boost-devel
    yum install boost-doc
    yum install python-devel python3-devel ruby-devel libX11-devel gtk-devel gtk2-devel gtk3-devel ncurses-devel
    yum install se python-devel python3-devel boost-devel llvm-clang-devel

    locate config | grep 'python2.7/config'
    ./configure --with-features=huge --enable-pythoninterp --enable-rubyinterp --enable-luainterp --enable-perlinterp --with-python-config-dir=/usr/lib/python2.7/config/ --enable-gui=gtk2 --enable-cscope --prefix=/usr
    make
    make install

    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    cd ~/.vim/bundle/YouCompleteMe
    python3 install.py --clangd-completer --all
}

# ==============================================================================

case "$(uname)" in
    Darwin) install_macos ;;
    Linux)  install_linux ;;
    *)      echo "Unsupported platform: $(uname)" ;;
esac
