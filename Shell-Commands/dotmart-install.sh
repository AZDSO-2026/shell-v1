echo -e "\e[35m >>>>>>>>>>>>> Install Nginx <<<<<<<<<<<<<<< \e[0m"
dnf install -y nginx

echo -e "\e[35m >>>>>>>>>>>>> Copy Nginx Config <<<<<<<<<<<<<<< \e[0m"
cp nginx.conf /etc/nginx/nginx.conf

echo -e "\e[35m >>>>>>>>>>>>> Install NodeJS <<<<<<<<<<<<<<< \e[0m"
curl -fsSL https://rpm.nodesource.com/setup_20.x | bash -
dnf install -y nodejs

echo -e "\e[35m >>>>>>>>>>>>> Download Frontend Code <<<<<<<<<<<<<<< \e[0m"
curl -L -o /tmp/frontend.zip https://raw.githubusercontent.com/raghudevopsb89/roboshop-microservices/main/artifacts/frontend.zip

echo -e "\e[35m >>>>>>>>>>>>> Create App Directory <<<<<<<<<<<<<<< \e[0m"
rm -rf /tmp/frontend
mkdir -p /tmp/frontend
cd /tmp/frontend

echo -e "\e[35m >>>>>>>>>>>>> Extract App Code <<<<<<<<<<<<<<< \e[0m"
unzip /tmp/frontend.zip

echo -e "\e[35m >>>>>>>>>>>>> Install App Dependencies & Build Html Code <<<<<<<<<<<<<<< \e[0m"
npm cache clean --force
npm install
npm run build

echo -e "\e[35m >>>>>>>>>>>>> Copy Built Code to Nginx <<<<<<<<<<<<<<< \e[0m"
rm -rf /usr/share/nginx/html/*
cp -r out/* /usr/share/nginx/html/

echo -e "\e[35m >>>>>>>>>>>>> Start Nginx Service <<<<<<<<<<<<<<< \e[0m"
systemctl restart nginx
systemctl enable nginx