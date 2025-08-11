echo "Add the new ristretto theme as an option"

if [[ ! -L ~/.config/grayhat/themes/ristretto ]]; then
  ln -nfs ~/.local/share/grayhat/themes/ristretto ~/.config/grayhat/themes/
fi
