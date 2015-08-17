( set -x 
  git submodule update --init --recursive
)
echo

files=".bashrc  .inputrc .vimrc .gitconfig .gitignore_global .octaverc .vim"

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

echo Finished bootstrapping dotphiles!

