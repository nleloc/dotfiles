#!/bin/bash

echo "Make sure to put dotfiles folder at home dir"
echo "And stow installed as well :D"
echo "Too lazy to write auto detect :))"
echo ""

echo -n "Do you want to proceed? (y/n): "
read confirm

if [[ $confirm != [yY] ]]; then
  echo "Ok"
  echo "Made no changes"
  exit 1
fi

wd=$HOME/.config/
cd $wd
echo -n "Backup your current config? (Y/n): "
read backup
if [[ $backup != [nN] ]]; then
  echo "Backing up, backup config folder would have _bak extension"
  mv caelestia caelestia_bak
  mv fastfetch fastfetch_bak
  mv fcitx5 fcitx5_bak
  mv hypr hypr_bak
  mv kitty kitty_bak
  mv nvim nvim_bak vicinae vicinae_bak
  mv wlogout wlogout_bak

  echo "Backup completed!"
else
  echo "ok"
  echo "removing it"
  rm -rf caelestia fastfetch fcitx5 hypr kitty nvim wlogout
fi
cd $HOME/dotfiles/
echo "Ok, stowing it"
stow caelestia fastfetch fcitx5 hypr kitty nvim wlogout

read -p "You want to apply my firefox userChome.css as well? (y/N)" ffcss
if [[ $ffcss == [yY] ]]; then
  echo "Okk"
  echo "Backing up it"
  pf_dir=$(find $HOME/.mozilla/firefox -name "*.default-release" | head -n 1)
  mv $pf_dir/chrome $pf_dir/chrome_backup
  ln -s $HOME/dotfiles/firefox/chrome $pf_dir/chrome
else
  echo "Oh, ok"
fi

echo "Done!"
