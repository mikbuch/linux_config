location=~/.config/i3/backup_`date +%Y%m%d` 
mkdir $location
mv ~/.config/i3/* $location
cp * ~/.config/i3
