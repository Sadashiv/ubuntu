#sudo visudoers
sudo apt-get update -y
#update-manager -p #Update the latest version
#sudo do-release-upgrade #Upgrade the 1.0LTS to 2.0LTS version


google_chrome=`dpkg -l google-chrome-stable`
if [[ $google_chrome =~ "google-chrome-stable" ]];
then
    echo "Google-chrome already installed"
else
    wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
fi

for installtype in install upgrade
do
    sudo sudo apt $installtype -y vlc git vim  wget gcc libncursesw5-dev libgdbm-dev libc6-dev libsqlite3-dev tk-dev \
    libssl-dev openssl zlib1g-dev libffi-dev libmysqlclient-dev libsasl2-dev python-dev libldap2-dev libbz2-dev \
    default-jdk net-tools nginx google-chrome-stable
done

#wget -c https://github.com/Sadashiv/interview_questions/blob/master/docker/get-docker-ce.sh
#chmod +x get-docker-ce.sh

docker_install=`dpkg -l docker`
if [[ $docker_install =~ "docker" ]];
then
    echo "Docker already installed `docker --version`"
else
    ./get-docker-ce.sh
    sudo apt install docker-scan-plugin
    sudo usermod -aG docker sada
fi

ansible_install=`dpkg -l ansible`
if [[ $ansible_install =~ "ansible" ]];
then
    echo "Ansible already installed `ansible --version`"
else
    sudo apt-add-repository ppa:ansible/ansible
    sudo apt install ansible -y 
fi

minikube_install=`dpkg -l minikube`
if [[ $minikube_install =~ "minikube" ]];
then
    echo "Minikube alread installed `minikube version`"
else
    wget -c https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
    sudo dpkg -i minikube_latest_amd64.deb
fi

docker_compose_install=`docker-compose` >> /dev/null
if [[ $? -eq 0 ]];
then
    echo "docker-compose alread installed `docker-compose version`"
else
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
fi

maven_install=`dpkg -l mvn`
if [[ $maven_install =~ "mvn" ]];
then
    echo "maven alread installed `mvn --version`"
else
    sudo apt install maven -y
fi


gradle_install=`gradle --version`
if [[ "Gradle" =~ $gradle_install ]];
then
    echo "Gradle installed `gradle -version`"
else
    wget -c https://downloads.gradle-dn.com/distributions/gradle-7.1.1-all.zip -P /opt
    unzip /opt/gradle-7.1.1-all.zip -d /opt
fi
