#! /bin/bash
add_user()
{
 if [ ! -e users.dat ];then
   touch users.dat
 fi
 echo "Please provide your details to add user:"
 read -p "First Name:" fname
 read -p "Last Name:" lname
 read -p "User Id:" uid
 count=$(cat users.dat | cut -d ":" -f 1 | grep $uid | wc -l)
 if [ $count -ne 0 ];then
   echo "User Id : $uid already exists, we cannot add user"
   return 1
 fi
 read -s -p "Password:" pwd
 echo
 read -p "Retype Password:" cpwd
 if [ $pwd != $cpwd ];then
   echo "Passwords are not matching,we cannot add user"
   return 2
 fi
 read -p "Zipcode:" zipcode
 echo "$uid:$pwd:$fname:$lname:$zipcode" >> users.dat
 echo "User added Successfully"
 echo
 echo
}
 search_user()
{
 read -p "Enter User Id:" uid
 read -p "Enter Password:" pwd
 available="no"
 while read line
 do
   fuid=$(echo $line | cut -d ":" -f 1)
   fpwd=$(echo $line | cut -d ":" -f 2)
   if [ $uid = $fuid -a $pwd = $fpwd ];then
      available="yes"
      echo "The complete information of the user is :"
      echo "User Id : $(echo $line | cut -d ":" -f 1)"
      echo "Password : $( echo $line | cut -d ":" -f 2)"
      echo "First Name : $(echo $line | cut -d ":" -f 3)"
      echo "Last Name : $(echo $line | cut -d ":" -f 4)"
      echo "Zipcode : $(echo $line | cut -d ":" -f 5)"
       break
   fi
 done < users.dat
  if [ $available = no ];then
     echo "User Id or Password not matched,specified user not available"
  fi
}
echo "WELCOME TO USER MANAGEMENT APPLICATION"
echo "######################################"
while [ true ]
do
  echo "1. Add User"
  echo "2. Search for User"
  echo "3. Change Password"
  echo "4. Delete User"
  echo "5. Show all Users"
  echo "6. Users count"
  echo "7. Exit"
  read -p "Enter your choice [1/2/3/4/5/6/7]:" choice
  case $choice in
    1)
      add_user
      ;;
    2)
      search_user
      ;;
  esac
done
