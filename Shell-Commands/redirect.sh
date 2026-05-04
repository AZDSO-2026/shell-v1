echo Log file Output : /tmp/roboshop.log
echo -e "\e[35m >>>>>>>>>>>>> Install Nginx <<<<<<<<<<<<<<< \e[0m" | tee -a /tmp/roboshop.log
dnf install -y nginx &>>/tmp/roboshop.log

echo -e "\e[32m >>>>>>>>>>>>> Copy Nginx Config <<<<<<<<<<<<<<< \e[0m" | tee -a /tmp/roboshop.log
cp nginx.conf /etc/nginx/nginx.conf &>>/tmp/roboshop.log 

echo -e "\e[32m >>>>>>>>>>>>> Install NodeJS <<<<<<<<<<<<<<< \e[0m"  | tee -a /tmp/roboshop.log
curl -fsSL https://rpm.nodesource.com/setup_20.x | bash - &>>/tmp/roboshop.log
dnf install -y nodejs &>>/tmp/roboshop.log 

echo -e "\e[33m >>>>>>>>>>>>> Download Frontend Code <<<<<<<<<<<<<<< \e[0m" | tee -a /tmp/roboshop.log
curl -L -o /tmp/frontend.zip https://raw.githubusercontent.com/raghudevopsb89/roboshop-microservices/main/artifacts/frontend.zip &>>/tmp/roboshop.log

echo -e "\e[33m >>>>>>>>>>>>> Create App Directory <<<<<<<<<<<<<<< \e[0m" | tee -a /tmp/roboshop.log
rm -rf /tmp/frontend >>/tmp/roboshop.log 2>&1
mkdir -p /tmp/frontend >>/tmp/roboshop.log 2>&1
cd /tmp/frontend >>/tmp/roboshop.log 2>&1

echo -e "\e[33m >>>>>>>>>>>>> Extract App Code <<<<<<<<<<<<<<< \e[0m" | tee -a /tmp/roboshop.log
unzip /tmp/frontend.zip &>>/tmp/roboshop.log

echo -e "\e[33m >>>>>>>>>>>>> Install App Dependencies & Build Html Code <<<<<<<<<<<<<<< \e[0m" | tee -a /tmp/roboshop.log
npm cache clean --force &>>/tmp/roboshop.log
npm install &>>/tmp/roboshop.log
npm run build &>>/tmp/roboshop.log

echo -e "\e[33m >>>>>>>>>>>>> Copy Built Code to Nginx <<<<<<<<<<<<<<< \e[0m" | tee -a /tmp/roboshop.log
rm -rf /usr/share/nginx/html/* &>>/tmp/roboshop.log
cp -r out/* /usr/share/nginx/html/ &>>/tmp/roboshop.log

echo -e "\e[33m >>>>>>>>>>>>> Start Nginx Service <<<<<<<<<<<<<<< \e[0m" | tee -a /tmp/roboshop.log
systemctl restart nginx &>/tmp/roboshop.log
systemctl enable nginx &>/tmp/roboshop.log
