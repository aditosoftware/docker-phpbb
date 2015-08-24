#!/bin/sh


if [ -f "/a/run/10_init.sh" ]
  then
    for file in "/a/run"/*.sh
      do
        echo "SCRIPT start.sh is calling: '${file}'."
        ${file}
    done
else
   echo "#### NO SCRIPT FOUND ####"
fi


$1