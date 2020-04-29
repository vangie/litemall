#!/bin/bash

set -ex

BASE_API=${DOMAIN:-http://litemall.mofangdegisn.cn}

cd litemall-admin
BASE_API=$BASE_API/admin cnpm run build:prod

cd ../litemall-vue
VUE_APP_BASE_API=$BASE_API cnpm run build:prod

cd ..
mvn install && mvn clean package

fun deploy -y