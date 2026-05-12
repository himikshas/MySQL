#Initial setup and system update

mkdir Lab15
cd Lab15

sudo apt update
sudo apt upgrade -y

#encountered Lock error(packagekitd running)
ps aux | grep packagekit
sudo systemctl stop packagekit
sudo apt update

#Fixed broken packages 
sudo dpkg --configure -a
sudo apt --fix-broken install -y

#faced proxy error so removed previously install applications
sudo apt remove --purge libcifpp-data libcifpp2 dssp
sudo apt autoremove

#install docker 
sudo apt install -y ca-certificates curl gnupg

sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo chmod a+r /etc/apt/keyrings/docker.gpg


#add repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo $VERSION_CODENAME) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install docker-buildx-plugin


#proxy configuration
sudo mkdir -p /etc/systemd/system/docker.service.d
sudo tee /etc/systemd/system/docker.service.d/http-proxy.conf

[Service]
Environment="HTTP_PROXY=http://255hsbd011:himiksha24@proxy.ibab.ac.in:3128"
Environment="HTTPS_PROXY=http://255hsbd011:himiksha24@proxy.ibab.ac.in:3128"
Environment="NO_PROXY=localhost,127.0.0.1"

sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl restart docker

sudo docker pull node:18


#create docker project
mkdir express-docker-app
cd express-docker-app

vi package.json
vi Dockerfile


#build docker image
sudo docker build --build-arg HTTP_PROXY=http://255hsbd011@ibab.ac.in:himiksha24@proxy.ibab.ac.in:3128 \
--build-arg HTTPS_PROXY=http://255hsbd011@ibab.ac.in:himiksha24@proxy.ibab.ac.in:3128 \
-t express-app .

#run docker container
sudo docker run -p 8012:8012 express-app


#run multiple containers
sudo docker run -d -p 8013:8012 --name app1 express-app
sudo docker run -d -p 8014:8012 --name app2 express-app

#fix
sudo docker rm app2

sudo docker ps


#docker hub push
sudo docker login -u himikshas

sudo docker images
sudo docker tag express-app:latest himikshas/express-app:latest
sudo docker push himikshas/express-app:latest

#pull and run image
sudo docker pull inshikathakur/express-app:latest

sudo docker run -d -p 8015:8012 inshikathakur/express-app:latest
sudo docker ps

#186fb3df76097d664a19b7d6c0972326fad98a8be2b20f59383227c25aa79bb2
#CONTAINER ID   IMAGE                              COMMAND                  CREATED                  STATUS                  PORTS                                         NAMES
#186fb3df7609   inshikathakur/express-app:latest   "docker-entrypoint.s…"   Less than a second ago   Up Less than a second   0.0.0.0:8015->8012/tcp, [::]:8015->8012/tcp   pensive_dirac
#e52b061b42e7   express-app                        "docker-entrypoint.s…"   15 minutes ago           Up 15 minutes           0.0.0.0:8014->8012/tcp, [::]:8014->8012/tcp   app2
#a59df1ae1af3   express-app                        "docker-entrypoint.s…"   17 minutes ago           Up 17 minutes           0.0.0.0:8013->8012/tcp, [::]:8013->8012/tcp   app1
#a22da537b0d2   express-app                        "docker-entrypoint.s…"   41 minutes ago           Up 41 minutes           0.0.0.0:8012->8012/tcp, [::]:8012->8012/tcp   awesome_heyrovsky



