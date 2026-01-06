#!/bin/bash

echo ""
echo "Make sure to put dotfiles folder at home dir, stow installed"
echo "this thing will replace all your rices with mine, will add slection soon <('')"
echo "wrote for personal use, if you encounter any error, then..."
echo "idc :D"
echo ""
sleep 2

backupfn() {
  mv caelestia caelestia_bak &>/dev/null
  mv fastfetch fastfetch_bak &>/dev/null
  mv fcitx5 fcitx5_bak &>/dev/null
  mv hypr hypr_bak &>/dev/null
  mv kitty kitty_bak &>/dev/null
  mv nvim nvim_bak vicinae vicinae_bak &>/dev/null
  mv wlogout wlogout_bak &>/dev/null
}

echo -n "Do you want to proceed? (y/N): "
read confirm

if [[ $confirm != [yY] ]]; then
  echo "ok"
  echo "Made no changes"
  exit 1
fi

wd=$HOME/.config/
cd $wd
echo -n "Backup your current config? (Y/n): "
read backup

if [[ $backup != [nN] ]]; then
  echo "Backing up, backup config folder would have _bak extension"
  backupfn # call backup function
  echo "Backup completed!"
else
  echo "You sure? (y/n):"
  read dbcheck

  if [[ $dbcheck == [yY] ]]; then
    echo "ok"
    echo "removing it"
    rm -rf caelestia fastfetch fcitx5 hypr kitty nvim wlogout
  else
    backupfn # call backup function, nothing's better than backup :D
    echo "ok, i knew it"
  fi
fi

cd $HOME/dotfiles/
echo "ok"
stow caelestia fastfetch fcitx5 hypr kitty nvim wlogout

read -p "You want to apply my firefox userChome.css as well? (y/N)" ffcss
if [[ $ffcss == [yY] ]]; then
  echo "Okk"
  echo "Backing up it"
  pf_dir=$(find $HOME/.mozilla/firefox -name "*.default-release" | head -n 1)
  mv $pf_dir/chrome $pf_dir/chrome_backup
  ln -s $HOME/dotfiles/firefox/chrome $pf_dir/chrome
else
  echo "ok"
fi

echo "Done!"
