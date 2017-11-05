#!/bin/bash
#_________________________________________________________________________________________________
#
# Date          : 20/07/2016 
# Organisation  : public
# Description   : connecting to oracle from UNIX server 
#_________________________________________________________________________________________________
# Script requires parameters 1) sql file name

set -x
. $BASE_PATH/appl/common/bin/environment_variables.env

FILE_NAME=$1 # this file contains sql for oracle
USER_NAME=$USERNAME  # comes from environment_variables.env
PASSWORD=`sh -x $BASE_PATH/appl/common/bin/decrypt.sh $BASE_PATH/appl/common/bin/pwd_out.dat` # comes from ecryption decryption password file
CONNECTION_STRING=$CONNECTION_STRING # comes from environment_variables.env

sqlplus -s $USER_NAME/$PASSWORD@$CONNECTION_STRING @$FILE_NAME
if [ $? -eq 0 ]
then
	echo "$1 file sql script executed "
else
	echo "Some prblem to upload data.."
	return 9
fi
