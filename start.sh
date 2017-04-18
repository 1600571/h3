setxkbmap fi
sudo apt-get update
sudo apt-get install -y git puppet
git clone https://github.com/1600571/h3.git
cd /home/xubuntu/h3
bash apply.sh
