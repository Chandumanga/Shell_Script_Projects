#! /bin/bash
add_book()
{
 read -p "Enter name of the book to add :" newbook
 books[$i]=$newbook
 let i++
 echo "$newbook book is added successfully"
}
delete_book()
{
 read -p "Enter name of the book to delete :" book_to_delete
 available="no"
 for index in ${!books[@]}
 do
   if [ ${books[$index]} = $book_to_delete ];then
    available="yes"
    unset books[$index]
    echo "$book_to_delete book deleted successfully"
    break
   fi
 done
 if [ $available = "no" ];then
   echo "$book_to_delete book is not available,cannot be deleted"
 fi
}
list_book()
{
 if [ ${#books[@]} -eq 0 ];then
  echo "No books are available"
  echo
  return 1
 fi
echo "List of All available books"
echo "----------------------------"
for book in ${books[@]}
do
  echo $book
done
}
echo "WELCOME TO BOOK MANAGEMENT APPLICATION"
echo "######################################"
declare -a books
i=0
while [ true ]
do
 read -p "Which operation you want to perform [add|delete|list|exit]: " option
 case $option in
 add)
   add_book
   ;;
 delete)
   delete_book
   ;;
 list)
   list_book
   ;;
 exit)
   echo "Thanks for using Application"
   exit 0
   ;;
 *)
   echo "Wrong option,Try Again"
 esac
done
