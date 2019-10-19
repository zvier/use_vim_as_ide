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

#mkdir -p download/clang+llvm
#cd download/clang+llvm
#wget http://releases.llvm.org/9.0.0/clang+llvm-9.0.0-aarch64-linux-gnu.tar.xz
#tar Jxvf  clang+llvm-9.0.0-aarch64-linux-gnu.tar.xz
#cd download
#mkdir ycm_build
#cd ycm_build
#cmake -G "Unix Makefiles" -DUSE_SYSTEM_BOOST=ON -DPATH_TO_LLVM_ROOT=~/download/clang+llvm/ . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp

cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clangd-completer --all
