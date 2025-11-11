#!/usr/bin/env bash

docker compose -f mapit_pwd.yml down --volumes

export APPS_JSON_BASE64=$(base64 -w 0 apps_mapit.json)

echo "############# APPS_JSON_BASE64 ################\n\n"

echo $APPS_JSON_BASE64

echo "############# APPS_JSON_BASE64 ################\n\n"


docker compose -f mapit_pwd.yml build

docker compose -f mapit_pwd.yml up -d

