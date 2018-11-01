#!/bin/sh
#mkdir /home/ec2-user/Oracle_User_Management
input="/home/ec2-user/Oracle_User_Password_Change.csv"
while IFS=',' read -r f1 f2
do
echo "sqlplus system/atos123 <<EOF
begin
#ALTER USER $f1 IDENTIFIED BY $f2;
end;
exit;
EOF" > /home/ec2-user/oracle_password_change_user_dynamic.sh

chmod +x /home/ec2-user/oracle_password_change_user_dynamic.sh
cd /home/ec2-user
./oracle_password_change_user_dynamic.sh
done < "$input"
