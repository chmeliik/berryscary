FROM docker.io/node:20

# Make node-gyp find the pre-installed node headers
ENV npm_config_nodedir=/usr/local
# Let the build set cacheFolder
ARG YARN_CACHE_FOLDER

COPY . /src
WORKDIR /src

RUN yarn install && yarn build

CMD ["yarn", "berryscary", "--name", "King Arthur"]
