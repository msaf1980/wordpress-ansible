#!/bin/bash

[ -f "/run" ] && exit

RUN=0
for i in 1 10 15 30 60
do
  if mysqladmin -u root ping; then
    RUN=1
    break
  fi
  sleep $i
done

if [ "${RUN}" -eq "1" ]; then
  for sql in `dirname $0`/*.sql
  do
    mysql -u root < ${sql}
  done
else
   echo "mysql not running"
   exit 1
fi

touch /run
