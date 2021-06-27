#!/bin/bash

HEAD() {
  echo -e "\e[1m$1\e[0m"
}
STAT() {
      if [ $1 -eq 0 ]
      then
        echo -e "\e[1;32mDone...\e[0m"
        else
          echo -e "\e[1;31mFail...\e[0m"
          echo -e "\e[1;33mCheck the logs for more details...\e[0m"
          exit 1
}