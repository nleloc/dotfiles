#!/bin/bash

echo ""
echo "Make sure to put dotfiles folder at home dir, stow installed"
echo "this thing will replace all your rices with mine, will add slection soon <('')"
echo "wrote for personal use, if you encounter any error, then..."
echo "idc :D"
echo ""
sleep 2

TS=$(date +%s)

backupfn() {
  for app in caelestia fastfetch fcitx5 hypr kitty nvim vicinae wlogout; do
    if [ -d "$app" ]; then
      mv "$app" "${app}_bak_${TS}" &>/dev/null
    fi
  done
}

echo -n "Do you want to proceed? (y/N): "
read confirm

if [[ $confirm != [yY] ]]; then
  echo "ok"
  echo "Made no changes"
  exit 1
fi

wd=$HOME/.config/
cd "$wd" || {
  echo "Directory $wd not found!"
  exit 1
}
echo -n "Backup your current config? (Y/n): "
read backup

if [[ $backup != [nN] ]]; then
  echo "Backing up, backup config folder will have _bak_$TS extension"
  backupfn # call backup function
  echo "Backup completed!"
else
  echo "You sure? (y/n):"
  read dbcheck

  if [[ $dbcheck == [yY] ]]; then
    echo "ok"
    echo "removing it"
    rm -rf caelestia fastfetch fcitx5 hypr kitty nvim vicinae wlogout
  else
    backupfn # call backup function, nothing's better than backup :D
    echo "ok, i knew it"
  fi
fi

cd "$HOME/dotfiles" || {
  echo "dotfiles folder not found!"
  exit 1
}
echo "ok"

echo "Applying dotfiles..."
stow -t ~/.config caelestia fastfetch fcitx5 hypr kitty nvim wlogout

read -p "You want to apply my firefox userChrome.css as well? (y/N): " ffcss
if [[ $ffcss == [yY] ]]; then
  echo "okk, applying Firefox CSS"
  pf_dir=$(find "$HOME/.config/mozilla/firefox" -maxdepth 1 -name "*.default-release" | head -n 1)

  if [ -n "$pf_dir" ]; then
    if [ -d "$pf_dir/chrome" ]; then
      mv "$pf_dir/chrome" "$pf_dir/chrome_backup_$TS"
    fi
    ln -s "$HOME/dotfiles/firefox/chrome" "$pf_dir"
    echo "Firefox CSS applied!"
  else
    echo "Firefox profile not found, skipped"
  fi
else
  echo "ok"
fi

echo "Done!"
