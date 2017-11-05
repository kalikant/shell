#!/bin/bash
set -x
CLASSPATH=$CLASSPATH:.:$ENV_PATH/common/bin/commons-logging.jar:$ENV_PATH/common/bin/commons-cli-1.0.jar:$ENV_PATH/common/bin/cloveretl.engine.jar:$ENV_PATH/common/bin/::/usr/java/jdk1.6.0_33/lib/::/usr/java/jdk1.6.0_33/bin/

PATH=$PATH::/usr/java/jdk1.6.0_33/bin
JAVA_HOME=:/usr/java/jdk1.6.0_33

export CLASSPATH
export PATH
export JAVA_HOME

dpl_passw=`cat $1`
pass=`java EnigmaEncrypt D $dpl_passw`
echo "${pass}"
