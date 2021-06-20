#sudo visudoers
sudo apt-get update -y
google_chrome=`dpkg -l google-chrome-stable`
if [[ $google_chrome =~ "google-chrome-stable" ]];
then
    echo "Google-chrome already installed"
else
    wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
fi

sudo sudo apt install -y vlc git vim  wget gcc libncursesw5-dev libgdbm-dev libc6-dev libsqlite3-dev tk-dev \
libssl-dev openssl zlib1g-dev libffi-dev libmysqlclient-dev libsasl2-dev python-dev libldap2-dev libbz2-dev \
default-jdk net-tools nginx

#wget -c https://github.com/Sadashiv/interview_questions/blob/master/docker/get-docker-ce.sh
#chmod +x get-docker-ce.sh

docker_install=`dpkg -l docker`
if [[ $docker_install =~ "docker" ]];
then
    echo "Docker already installed"
else
    ./get-docker-ce.sh
    sudo usermod -aG docker sada
fi
