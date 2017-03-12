#!/bin/bash
MESSAGE_FILE="2017MAR12-representative.txt"
RECIPIENT_FILE="fix.txt"
MESSAGE_CHARS=$(wc -c ${MESSAGE_FILE} |awk '{print $1}')

for x in $(cat ${RECIPIENT_FILE}); do {
  X_CHARS=$(echo ${x}|wc -c|awk '{print $1}')
  if [ $(( ${MESSAGE_CHARS} + ${X_CHARS})) -gt 139 ]; then {
    echo "${x} NOT SENT; over character limit";
  } else { 
    if (t update "${x} $(cat ${MESSAGE_FILE})"); then {
      echo "${x} SENT $(cat ${MESSAGE_FILE}) >> log.txt";
      sleep 10;
    }; fi
  }; fi
}; done
