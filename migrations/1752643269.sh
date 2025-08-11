echo "Add new matte black theme"

if [[ ! -L "~/.config/grayhat/themes/matte-black" ]]; then
  ln -snf ~/.local/share/grayhat/themes/matte-black ~/.config/grayhat/themes/
fi
