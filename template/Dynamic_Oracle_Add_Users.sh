#!/bin/sh
#mkdir /home/ec2-user/Oracle_User_Management
cd /u01/app/oracle/product/11.2.0/xe/bin
. ./oracle_env.sh
input="/home/ec2-user/Oracle_Add_User.csv"
while IFS=',' read -r f1 f2 f3 f4 f5
do
echo "sqlplus system/atos123 <<EOF
begin
#create user $f1 identified by $f2;
#GRANT $f3,$f4,$f5 TO $f1;
end;
exit;
EOF" > /home/ec2-user/oracle_add_user_dynamic.sh

chmod +x /home/ec2-user/oracle_add_user_dynamic.sh
cd /home/ec2-user/
./oracle_add_user_dynamic.sh
done < "$input"

