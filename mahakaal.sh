#!/usr/bin/env bash

docker compose -f mahakaal_pwd.yml down --volumes

export APPS_JSON_BASE64=$(base64 -w 0 apps_mahakaal.json)

echo "############# APPS_JSON_BASE64 ################\n\n"

echo $APPS_JSON_BASE64

echo "############# APPS_JSON_BASE64 ################\n\n"


docker compose -f mahakaal_pwd.yml build

FRONTEND_PORT=8890 docker compose -f mahakaal_pwd.yml up -d

