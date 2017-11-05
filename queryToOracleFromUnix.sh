#!/bin/bash
#_________________________________________________________________________________________________
#
# Date          : 20/07/2016 
# Organisation  : public
# Description   : script to connect oracle DB and store output in unix file.
#_________________________________________________________________________________________________
# Script requires  

set -x
. $BASE_PATH/appl/common/bin/environment_variables.env

DATABASE_NAME="oracle_db"
TABLE_NAME="oracle_table"
FILTER_CONDITION="'val-1','val-2','val-3'"

# $USERNAME/$PASSWORD@$CONNECTION_STRING these details come from environment variable file
sqlplus -S $USERNAME/$PASSWORD@$CONNECTION_STRING <<EOF > $BASE_PATH/appl/output/oracle_query_output.txt
set echo off
set feed off
set heading off
set pagesize 0
set trimspool on
set linesize 16000;
set wrap off;
set verify off;
set serveroutput on size unlimited
WHENEVER OSERROR EXIT 9;
WHENEVER SQLERROR EXIT SQL.SQLCODE;

select
column_1
||'|'||column_2
||'|'||column_3
||'|'||column_4
from ${DATABASE_NAME}.{TABLE_NAME}
where column_4 in (${FILTER_CONDITION})';
exit;
EOF
