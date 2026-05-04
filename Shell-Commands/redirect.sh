echo Log file Output : /tmp/roboshop.log
echo -e "\e[35m >>>>>>>>>>>>> Install Nginx <<<<<<<<<<<<<<< \e[0m" 
dnf install -y nginx >>/tmp/roboshop.log 2>&1

echo -e "\e[35m >>>>>>>>>>>>> Copy Nginx Config <<<<<<<<<<<<<<< \e[0m" 
cp nginx.conf /etc/nginx/nginx.conf >>/tmp/roboshop.log 2>&1

echo -e "\e[35m >>>>>>>>>>>>> Install NodeJS <<<<<<<<<<<<<<< \e[0m" 
curl -fsSL https://rpm.nodesource.com/setup_20.x | bash - &>>/tmp/roboshop.log
dnf install -y nodejs >>/tmp/roboshop.log 2>&1

echo -e "\e[35m >>>>>>>>>>>>> Download Frontend Code <<<<<<<<<<<<<<< \e[0m" 
curl -L -o /tmp/frontend.zip https://raw.githubusercontent.com/raghudevopsb89/roboshop-microservices/main/artifacts/frontend.zip &>>/tmp/roboshop.log

echo -e "\e[35m >>>>>>>>>>>>> Create App Directory <<<<<<<<<<<<<<< \e[0m" 
rm -rf /tmp/frontend >>/tmp/roboshop.log 2>&1
mkdir -p /tmp/frontend >>/tmp/roboshop.log 2>&1
cd /tmp/frontend >>/tmp/roboshop.log 2>&1

echo -e "\e[35m >>>>>>>>>>>>> Extract App Code <<<<<<<<<<<<<<< \e[0m" 
unzip /tmp/frontend.zip >>/tmp/roboshop.log 2>&1

echo -e "\e[35m >>>>>>>>>>>>> Install App Dependencies & Build Html Code <<<<<<<<<<<<<<< \e[0m" 
npm cache clean --force >>/tmp/roboshop.log 2>&1
npm install >>/tmp/roboshop.log 2>&1
npm run build >>/tmp/roboshop.log 2>&1

echo -e "\e[35m >>>>>>>>>>>>> Copy Built Code to Nginx <<<<<<<<<<<<<<< \e[0m" 
rm -rf /usr/share/nginx/html/* >>/tmp/roboshop.log 2>&1
cp -r out/* /usr/share/nginx/html/ >>/tmp/roboshop.log 2>&1

echo -e "\e[35m >>>>>>>>>>>>> Start Nginx Service <<<<<<<<<<<<<<< \e[0m" 
systemctl restart nginx >>/tmp/roboshop.log 2>&1
systemctl enable nginx >>/tmp/roboshop.log 2>&1

