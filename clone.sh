clear
echo -n "      _   _ ____  _     
  ___| | | |  _ \| |    
 / __| | | | |_) | |    
| (__| |_| |  _ <| |___ 
 \___|\___/|_| \_\_____|"
echo " "
echo " "
read -p "Tüm depolarını klonlayacağınız kullanıcı adını girin:" user
curl -s "https://api.github.com/users/$user/repos?per_page=1020" | grep \"clone_url\" | awk '{print $2}' | sed -e 's/"//g' -e 's/,//g' | xargs -n1 git clone

read -p "Bu dizindeki her klasörü zip yapmak istiyor musunuz? (y/n): " answer
if [ "$answer" == "y" ]; then
    find . -maxdepth 1 -type d -exec sh -c 'zip -r "${1%/}.zip" "$1"' _ {} \;
    echo "Klasörler başarıyla zip'lendi."
elif [ "$answer" == "n" ]; then
    echo "Zip işlemi yapılmadı."
else
    echo "Geçersiz giriş. Zip işlemi yapılmadı."
fi
