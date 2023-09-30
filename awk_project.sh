#! /bin/bash
help_function()
{
echo "$0 can provide information based on location,extension including memory info"
echo
echo "$0 [-l location][--location location][-e extension][--extension extension][- s|--stats][-h|--help]"
echo
echo "Examples:"
echo "$0 -l /etc"
echo "$0 -l /etc -e conf"
echo "$0 -l /etc -e conf --stats"
exit 2 
}
LOCATION=$(pwd)
EXTENSION=""
STATS=0
while [ $# != 0 ]
do 
  case $1 in
   -l|--location)
      LOCATION=$2
      if [ ! -d $LOCATION ];then
         echo "Your provided location either not a valid directory or does not exit"
         exit 1
      fi
      shift
      shift
      ;;
   -e|--extension) 
      EXTENSION=$2
      shift
      shift
      ;;
   -s|--stats)
      STATS=1
      shift
      ;;
   -h|--help)
     help_function
     ;;
   *)
    echo "You are providing invalid option, please check help doc below"
    help_function
  esac
done  

echo -n "This script finding all files with "
 if [ "$EXTENSION" = "" ]; then
   echo -n "all extensions in "
 else
  echo -n ".$EXTENSION extension in "
 fi
 echo "$LOCATION location"
 echo 
 
 ls -l $LOCATION | awk '/^-/' | grep ".$EXTENSION$" &> /dev/null
 if [ $? -ne 0 ];then
    echo "But, No files Found in $LOCATION location with .$EXTENSION extension"
    exit 3
 fi   
 
 ls -l $LOCATION | awk '/^-/' | grep ".$EXTENSION$" | awk 'BEGIN{sum=0;}{sum=sum+$5;}END{print "The Number of Files:" NR;print "The Total Size of all files: " sum " Bytes";print "The Total Size of all files: " sum/1024 " KB";print "The Total Size of all files: " sum/1024/1024 " MB";print ""}'
 
 if [ $STATS -eq 1 ]; then
   echo "The Statistics Are:"
   ls -l $LOCATION | awk '/^-/' | grep ".$EXTENSION$" | awk '{if(NR==1){min_file_size=$5;min_file_name=$9;max_file_size=$5;max_file_name=$9;}else{if($5<min_file_size){min_file_size=$5;min_file_name=$9;}if($5>max_file_size){max_file_size=$5;max_file_name=$9;}}}END{print "The Smallest File Name: " min_file_name;print "The Smallest File Size: " min_file_size;print "The Largest File Name: " max_file_name;print "The Largest File Size: " max_file_size;}'
 fi
  
