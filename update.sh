#!/bin/bash
Repo="https://raw.githubusercontent.com/rizkihdyt6/asu/asu/"
LocalVersion=$(cat /root/versi)
Version=$(curl -sS ${Repo}update/versinew | awk '{print $1}')
if [ $LocalVersion = $Version ]; then
echo -e "\e[32mScript Sudah Versi Terbaru...\e[0m"
else
echo -e "\e[32mAda Update Script!!\e[0m";
wget -q -O updateyes.sh ${Repo}update/updateyes.sh && chmod +x updateyes.sh && ./updateyes.sh
rm -f updateyes.sh
fi
