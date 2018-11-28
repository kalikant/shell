## this is a list of useful UNIX commands in daily work
## commands are tested in bash shell

# null count in data file
grep '^ANULL^A' abc.txt |wc -l

# to make file blank before adding anything
> $UNIX_FILEPATH/abc.txt

# exact word count in file with case
grep -w 'Kalikant Jha' abc.txt |wc -l

# removing header and trailer lines in unix file

sed -i 1d abc.txt  # first line
sed -i 1,2d abc.txt  # first 2 lines
sed -i 1,nd abc.txt  # first n lines
sed -i '$d' abc.txt  # last line 

awk 'NR > 2 { print }' abc.txt > xyz.txt # ignore first 2 lines in new file in unix
awk 'NR > 2' abc.txt > xyz.txt # ignore first 2 lines in new file

tail -n +2 abc.txt > abc.txt.out

# removing control a ( ctrl-a ) characters from a list of files in unix
sed -r -i "s/$(echo -e $'\001')/$(echo -e $'|')/g" *.dat 

# removing NULL characters from hive output file with ctrl-a as data delimiter  in unix
sed -r -i "s/$(echo -e $'\001') {0,}NULL {0,}$(echo -e $'\001')/$(echo -e $'\001')$(echo -e $'\001')/g" abc.txt  

# find data delimiter count at each row in a file ( ctrl a )
# to verify file structure is appropriate before loading
awk -F'\x01' '{print NF}' abc.txt | sort  |uniq -c 

# adding variable to source file or bash init file or into profile , profile variable update in unix
echo "export GLOBAL_VALUE=/usr/software/hive/" >> ~/.profile
source ~/.profile

# run script through nohup to track log , script status code and output even if terminal session ends in unix
nohup sh -x $GLOBAL_VALUE/appl/scripts/testing.sh abc xyz 123 2017-09-14 &

# to list out all nohup jobs
jobs

# to kill any specific job in unix
ps -ef | grep abc.sh 
kill -9 job_id

# zipping file in unix
zip abx.txt 
zip bundle.zip abc.txt xyz.txt

# zipping a complete directory in unix 
zip -r bundle.zip /abc/xyz/

# unzipping files in unix
unzip bundle.zip

# if zip util is not installed
jar -xf bundle.zip

# creating g-zip file in unix
gzip -c abc.txt  > abc.txt.gz

# unzipping gzip files in unix
gunzip abc.txt.gz

# to see content of gzip compressed files in unix without uncompressing
zcat abc.txt.gz | more

# tar or untar the files in unix
# to compress the file us below command
tar -zcvf abc.tgz /abc/xyz/
#to uncompress use it
tar -zxvf abc.tgz

# 7zip compression in unix
7za a bundle.7z abc.txt xyz.txt /abc/xyz/

# 7zip de-compression in unix
7za x bundle.7z

# getting row count report of all unix files in 1 command
wc -l *.txt

# checking if firewall port is open in unix 
telnet 111.211.333.444 1234

# sftp to specific port in unix  
sftp -oPort=1234 unix_user@111.211.333.444 

# private and public key generation for pasword less ssh connection to other unix server
ssh-keygen -t rsa
cat ~/.ssh/id_rsa_xxx.pub | ssh -p 5555 user@123.45.56.78 "mkdir -p ~/.ssh && cat >>  ~/.ssh/authorized_keys"

# to get the file size report in human readeble format in unix
dk -h

# to get the running script file name in unix
script_file_name=`basename $0`

# lower to upper and upper to lower transformation in unix

word_lower=`echo "WORD" | tr '[:upper:]' '[:lower:]'`
word_upper=`echo "word" | tr '[:lower:]' '[:upper:]'`

# sending mail in UNIX
mail_body="This is testing of UNIX mail command"
subject="TEST MAIL"
cc_mail_list="abc@example.com"
to_mail_list="xyz@example.com"
bcc_mail_list="asdf@example.com"
from_mail="admin@example.com"
echo ${mail_body} | mail -s "${subject}" -c ${cc_mail_list} ${to_mail_list} -b ${bcc_mail_list} 
echo ${mail_body} | mailx -r "${from_mail}" -s "${subject}" ${to_mail_list} 

# spliting the string in UNIX using awk command
flag=`$(awk -F'|' '$2 == "TRUE" {print $1}')`
# splitting and appending string in UNIX using awk
new_string=`awk -F"|" 'BEGIN { FIRST_PART="" } { $2 == "Y"; print p"abc"$1"xyz"; p=","}'`

# finding a specific word count and derive logic using if else construct in unix
if [[ $(grep -c "word" $GLOBAL_VALUE/abc.txt) -gt 0 ]]; then
  export success="SUCCESS";
else
  export success="FAIL";
fi

# checking if call of other script file status code in UNIX
if [ $? -gt 0 ]
  then
    echo "script failed " | tee -a ${logFile}
      exit 11
   else
	echo "script success " | tee -a ${logFile}
      exit 0
fi
	  
# using case in unix to setup varialbe values
case ${COUNTRY} in
  USA)  export output="United States of Americas";;
   SG)  export output="Singapore";;
  IND)  export output="India";;
  *)    export output="All Countries";;
esac

# checking no of parameters are passed to script
if [ $# -lt 4 ] || [ $# -gt 4 ]
then
        echo $#" parameters passed; required 4"
        echo "USAGE : <aaa> <aaa> <aaa> <aaa>"
exit 1
fi

# checking if file present in a directory in UNIX
FILE_EXIST=`ls $dir`
	if [ -z $FILE_EXIST ]
	then
		echo "no files present"
		exit 9
	else
		echo "file present"
		exit 0
	fi
	
# for loop example in UNIX
FILE_LIST=`ls /abc/xyz/`
for EACH_FILE in $FILE_LIST
do 
	echo "$EACH_FILE"
	# renaming files in unix
	mv $EACH_FILE /abc/xyz/${EACH_FILE}.new
done

# finding all files in a directory and filtering based on date in UNIX
cd /abc/xyz/
UNIQUE_DATE=`ls | cut -d . -f2 | sort -u`	
for EACH_DATE in $UNIQUE_DATE
do
	mkdir -p /abc/xyz/${EACH_DATE}
	mv *"${EACH_DATE}"* /abc/xyz/"${EACH_DATE}"/
done

# bypass errors and continue processing in UNIX loop
if [[ $? -ne 0 ]]
then
	cat /dev/null > $ERROR_STATUS_FILE
	echo "Error in distcp for the table ${table_name}/${part_name}=${partition}" >> $LOG_FILE
		echo -e "\n" >> $LOG_FILE
		exit 1
	else
		run_status="SUCCEEDED"
fi
cat /dev/null > $ERROR_STATUS_FILE

# writing log into Log file in unix , function example in UNIX
write_log () {
        set -x
        type=$1
        msg=$2
        timestamp=`date '+%Y-%m-%d %H:%M:%S'`

        echo "${type}:${timestamp}:${msg}" >> $log_path/$log_file
}

write_log_and_screen () {
        type=$1
        msg=$2
        timestamp=`date '+%Y-%m-%d %H:%M:%S'`

        echo "${type}:${timestamp}:${msg}"
        echo "${type}:${timestamp}:${msg}" >> $log_path/$log_file
}

write_log_wotime () {
	msg=$1
	timestamp=`date '+%Y-%m-%d %H:%M:%S'`

	echo "${msg}"
	echo "${msg}" >> $log_path/$log_file 
}

write_log_and_screen info "calling function in UNIX"
write_log_wotime info "calling function in UNIX"
write_log info "calling function in UNIX"

# reading values from property file in UNIX file
# property file format KEY=VALUE
flag=`grep "KEY=" ${PROPFILE} | sed "s/.*=\(.*\)/\\1/g"`

# splitting string in UNIX using cut command
HEADER_LINE="A|B|C|D|E"
VAL=`echo $HEADER_LINE | cut -d '|' -f1`
VAL=`echo $HEADER_LINE | cut -d '|' -f4`
VAL=`echo $HEADER_LINE | cut -d '|' -f1-3`  # to cut 1-3 column output A|B|C

# file conversion from windows to UNIX in unix
dos2unix /abc/xyz/*.txt

# mathematical expressions in UNIX
ROW_COUNT=`awk 'BEGIN{}END{print NR}' /abc/xyz/abc.txt `
# reducing count by 2 for 1 heade and 1 traile record
ACTUAL_ROW_COUNT=$(($ROW_COUNT-2))

# read each line from a file and process it to create new unix file
while read line
do 
	echo "${line} | appending data " >> $ENV_PATH/xyz.txt
done < $ENV_PATH/abc.txt

# checking if file is not empty or string is not empty in UNIX
FILE_CONTENT=`cat /abc/xyz.txt`
if [ ! -z ${FILE_CONTENT} ] 
then 
	echo ${FILE_CONTENT}
fi

# renaming bulk file in UNIX
#filename contains patern as 2016 and want to renamed it to 2017
rename '2016' '2017' *.txt 

# loading data into hive from UNIX 
hive -e "load data local inpath '/data/staging/*.txt' overwrite into table hive_db.hive_table PARTITION(date='2016-06-30');"

cut -d"^" -f 89 abc_xyz.txt | sort | uniq
A30
A50
cut -d"^" -f89 abc_xyz.txt | sort | uniq -c
446871 A30
 26209 A50
awk -F'^' '$89=="A30" { print $0 }' abc_xyz.txt | head -1
OUTPUT - FULL ROW


Remove duplidates based on "All columns except first":
awk -F"," '!_[$2]++' filename

Remove duplidates based on "4th,5th,6th" columns:
awk -F"^A" '!_[$4,$5,$6]++' filename

Shortcut in vi editor:
Shift+G  - cursor at end 
Ctrl+G    - no. of records

Append D^A value in all the rows as 1st column:
sed -i "s/^/D^A/g" abc_xyz.txt

Remove columns from 7 to 9
awk -F"" '[$1,$2,$3,$4,$5,$6,$10,$11]' abc.txt > xyz.txt
