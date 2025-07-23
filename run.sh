#!/usr/bin/env bash
#-------------------------------------------------------------------------------
#  Sample script to run the image with params
#-------------------------------------------------------------------------------

#-- Main settings
IMG_NAME=nginxbot      #-- container/image name
VERBOSE=1                #-- 1 - be verbose flag
SVER="20211103"

#-- Check architecture
[[ $(uname -m) =~ ^armv7 ]] && ARCH="armv7-" || ARCH=""

source functions.sh      #-- Use common functions

stop_container   $IMG_NAME
remove_container $IMG_NAME

docker run -d \
  --name $IMG_NAME \
  -p 8081:53/tcp \
  -e LAB1='This is var1' \
  -e VERBOSE=${VERBOSE} \
etaylashev/nginxbot:${ARCH}latest

exit 0
