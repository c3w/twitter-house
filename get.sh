#!/bin/bash

# gem install t
# authorize t with twitter, etc

SEARCH="R" #republicans
curl http://www.house.gov/representatives/>reps.html
grep -B3 "<td>${SEARCH}</td>" reps.html|grep -e '^[A-Z]'|awk '{print $1,$2}'|sort|uniq > reps.txt
cat reps.txt |awk '{print "@Rep"$2$1}'|tr -d ',' > ${SEARCH}-twitter.txt
