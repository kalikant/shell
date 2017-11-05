#!/bin/bash
set -x
CLASSPATH=$CLASSPATH:.:$ENV_PATH/common/bin/commons-logging.jar:$ENV_PATH/common/bin/commons-cli-1.0.jar:$ENV_PATH/common/bin/cloveretl.engine.jar:$ENV_PATH/common/bin/::/usr/java/jdk1.6.0_33/lib/::/usr/java/jdk1.6.0_33/bin/

PATH=$PATH::/usr/java/jdk1.6.0_33/bin
JAVA_HOME=:/usr/java/jdk1.6.0_33

export CLASSPATH
export PATH
export JAVA_HOME

java EnigmaEncrypt E $1 >$ENV_PATH/common/bin/$2
echo "$ENV_PATH/common/bin/$2"
chmod 755 $ENV_PATH/common/bin/$2
exit 0
