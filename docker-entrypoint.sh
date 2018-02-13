#!/bin/bash

sed -i 's/127.0.0.1/'${API_HOST}'/g' /usr/src/app/web/vue/UIconfig.js
sed -i '10s/3000/'${API_PORT}'/g' /usr/src/app/web/vue/UIconfig.js
sed -i 's/localhost/'${HTTP_HOST}'/g' /usr/src/app/web/vue/UIconfig.js
sed -i '16s/3000/'${HTTP_PORT}'/g' /usr/src/app/web/vue/UIconfig.js
sed -i 's/false/'${SSL}'/g' /usr/src/app/web/vue/UIconfig.js
sed -i '17s///'${WEB_ROOT}'/g' /usr/src/app/web/vue/UIconfig.js
exec "$@"
