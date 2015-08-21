files=".bashrc .zshrc .inputrc .vimrc .gitconfig .gitignore_global .octaverc"

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

echo Finished bootstrapping dotphiles!

