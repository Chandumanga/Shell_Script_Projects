#! /bin/bash
echo "WELCOME TO BOOK RENTAL APPLICATION"
echo "##################################"
cost_per_day=30
read -p "Was Book returned before 9PM [Yes|No] :" ontime
read -p "How many days was Book Rented :" days_rented
read -p "What day the Book rented :" day_rented
 
 if [ $ontime = "No" ];then
    days_rented=$[days_rented+1]
 fi
 if [ $day_rented = "Sunday" ];then
    cost=$(echo "$days_rented*$cost_per_day*0.5" | bc)
 elif [ $day_rented = "Saturday" ];then
    cost=$(echo "$days_rented*$cost_per_day*0.7" | bc)
 else
    cost=$(echo "$days_rented*$cost_per_day" | bc)
 fi
 echo "The cost of Book rented :Rs $cost"
 original_cost=$[days_rented*cost_per_day]
 discountF=$(echo "$original_cost-$cost" | bc)
 discountI=$(echo "$discountF" | cut -d "." -f 1)
 if [ $discountI -gt 0 ];then
   echo "Hello, You got Rs $discountF Discount,Enjoy...."
 fi
echo "Visit Again"

