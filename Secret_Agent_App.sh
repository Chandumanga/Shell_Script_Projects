#! /bin/bash
echo "WELCOME TO SECRET AGENT APPLICATION"
echo "###################################"

read -p "Enter Your Name :" name
first_char_name=$(echo -n $name | cut -c 1)
if [ $first_char_name != "C" ];then
  echo "Hello $name,Thanks for Your Information"
  exit 1
fi

read -p "Enter Your Favourite Actor Name :" actor
len=$(echo -n $actor | wc -c)
last_char_actor=$(echo -n $actor | cut -c $len)
if [ $last_char_actor != "r" ];then
 echo "Hello $name,Thanks for Your Information"
 exit 1
fi

read -p "Enter Your Lucky Number :" luckyno
if [ $luckyno -ne 8 ];then
  echo "Hello $name,Thanks for Your Information"
  exit 1
fi

read -p "Enter Your Favourite dish :" dish
no_of_chars_dish=$(echo -n $dish | wc -c)
if [ $no_of_chars_dish -lt 6 ];then
  echo "Hello $name,Thanks for Your Information"
  exit 1
fi
echo "Hello Secret Agent.....Our next operation is!!!"
echo "--------- be Alert!!!!"
