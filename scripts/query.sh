#!/bin/bash

echo "jstat -gcutil 1 10 250"
docker exec -it springboot-todo-service sh -c "jstat -gcutil 1 10 250 > /recordings/gcstats.txt"

read -p "Print heap summaries? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "jmap -histo 1"
  docker exec -it springboot-todo-service sh -c "jmap -histo 1 > /recordings/histoe.txt"
fi

# docker exec -it springboot-todo-service sh -c "jstatd -J-Djava.security.policy=jstatd.tools.policy -J-Djava.rmi.server.logCalls=true -J-Djava.rmi.server.hostname=localhost"