#!/bin/bash

logger () {
  echo "[`date`]" "$@"
}

cfgmerge () {
  perl -p -e 's/\$\{([^}]+)\}/defined $ENV{$1} ? $ENV{$1} : $&/eg; s/\$\{([^}]+)\}//eg' $1 | sed -e 's/""/"/g'
}

logger STARTING SERVER...

logger Replacing env files...
if [ -f "hydra.tpl" ]; then
  cfgmerge hydra.tpl > hydra.yml
else
  echo "There is no template file!!!"
fi


if [ "$MODE" == "debug" ]; then
  echo "Show hydra.yml and sleep 300s"
  cat hydra.yml
  sleep 3000;
fi

hydra migrate -c hydra.yml sql -e --yes