source common.sh

echo -e "${hs} Copy MongoDB Service file  ${he}" | tee -a ${log_file}
cp mongo.repo /etc/yum.repos.d/mongo.repo &>> ${log_file}
echo $?

echo -e "${hs} Install mongoDB  ${he}" | tee -a ${log_file}
dnf install -y mongodb-org &>> ${log_file}
echo $?

echo -e "${hs} updating MongoDB Config  ${he}" | tee -a ${log_file}
sed -i 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/' /etc/mongod.conf &>> ${log_file}
echo $?

echo -e "${hs} Start MongoDB Services ${he}" | tee -a ${log_file}
systemctl enable mongod &>> ${log_file}
systemctl restart mongod &>> ${log_file}
echo $?
