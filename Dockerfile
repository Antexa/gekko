FROM node:8

ENV API_HOST localhost
ENV API_PORT 3000
ENV HTTP_HOST localhost
ENV HTTP_PORT 3000
ENV SSL false
ENV WEB_ROOT /

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install GYP dependencies globally, will be used to code build other dependencies
RUN npm install -g --production node-gyp && \
    npm cache clean --force && \
    git clone git://github.com/askmike/gekko.git -b stable /usr/src/app && \
    npm install --production && \
    npm install --production redis@0.10.0 talib@1.0.2 tulind@0.8.7 pg && \
    npm cache clean --force && \
    chmod +x /usr/src/app/docker-entrypoint.sh

EXPOSE 3000
ENTRYPOINT ["/usr/src/app/docker-entrypoint.sh"]

CMD [ "npm", "start" ]
