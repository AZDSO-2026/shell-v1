source common.sh
component_name=catalogue
echo log file output: ${log_file}

echo -e "${hs} Install MYSQL Client  ${he}" | tee -a ${log_file}
dnf install -y mysql8.4 &>> ${log_file}
echo $?

echo -e "${hs} Load Schema, App User, & Master data ${he}" | tee -a ${log_file}
mysql -h mysql.krkaz2020.xyz -u root -pRoboShop@1 < db/schema.sql &>> ${log_file}
mysql -h mysql.krkaz2020.xyz -u root -pRoboShop@1 < db/app-user.sql &>> ${log_file}
mysql -h mysql.krkaz2020.xyz -u root -pRoboShop@1 ${component_name} < db/master-data.sql &>> ${log_file}
echo $?

golang_app