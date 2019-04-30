git clone git@github.com:vim/vim.git
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
locate config | grep 'python2.7/config'
./configure --with-features=huge --enable-pythoninterp --enable-rubyinterp --enable-luainterp --enable-perlinterp --with-python-config-dir=/usr/lib/python2.7/config/ --enable-gui=gtk2 --enable-cscope --prefix=/usr
make
make install
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

mkdir ycm_build
cd ycm_build
