files=".bashrc .inputrc .vimrc .gitconfig .gitignore_global .octaverc .ipython/profile_default/ipython_config.py"

ld=$PWD
cd $HOME 

for file in $files; do
  ( set -x 
  rm -rf -- $file 2> /dev/null
  ln -s $ld/$file $file
  )
  echo
done

for dir in `ls $ld/.config`; do
  ( set -x
  rm -rf -- .config/$dir 2> /dev/null
  ln -s $ld/.config/$dir .config/$dir
  )
  echo
done  

(set -x;
rm -rf -- .vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
)
vim +PluginInstall +qall
echo


(set -x;
ln -s $ld/.vim/syntax .vim/syntax
)

#install zsh and ohmyz
(set -x;
rm -fr .oh-my-zsh/
sudo apt-get install zsh
curl -L http://install.ohmyz.sh > install.sh
sh install.sh
rm install.sh
)

for file in $(ls $ld/zsh/themes); do
(set -x;
ln -s $ld/zsh/themes/$file .oh-my-zsh/themes/$file
)
done

(set -x;
rm .zshrc && ln -s $ld/.zshrc 
zsh
)

echo Finished bootstrapping dotphiles!

