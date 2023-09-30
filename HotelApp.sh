#! /bin/bash
echo "########### WELCOME TO ISHA HOTEL ###########"
echo
amount=0
while [ true ]
do
 echo "Menu Items"
 echo "-----------------"
 echo "A ------> Vadapov (Each plate Rs 30 /-)"
 echo "B ------> Dosa (Each plate Rs 50 /-)"
 echo "C ------> Poori (Each plate Rs 40 /-)"
 echo "D ------> Idli (Each plate Rs 25 /-)"
 read -p 'Choose your required item A|B|C|D :' option
 case $option in
  A)
   read -p 'Enter number of plates of Vadapov, you require :' quantity
   amount=$[amount + quantity*30]
   ;;
 B)
   read -p 'Enter number of plates of Dosa, you require :' quantity
   amount=$[amount + quantity*50]
   ;;
 C)
  read -p 'Enter number of plates of Poori, you require :' quantity
   amount=$[amount + quantity*40]
   ;;
  D)
   read -p 'Enter number of plates of Idli, you require :' quantity
   amount=$[amount + quantity*25]
   ;;
  *)
   echo 'You entered invalid option.Choose Again!'
   continue
   ;;
 esac
 read -p 'Do you want to order any other item [Yes|No]:' option
 case $option in
   [Yy]|[Yy][Ee][Ss])
   continue
   ;;
  [Nn]|[Nn][Oo])
  break
  ;;
 esac
done
echo "Your Total Bill amount : Rs $amount/-"
echo "Thanks for visiting ISHA HOTEL"
  
