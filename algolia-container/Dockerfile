FROM node:lts
ARG TARGET
ARG KEY
COPY package.json /package.json
COPY index.de.json /index.de.json
COPY index.en.json /index.en.json
RUN npm install webpack atomic-algolia
RUN ALGOLIA_APP_ID=GEETCE1DI1 \
    ALGOLIA_ADMIN_KEY=${KEY} \
    ALGOLIA_INDEX_NAME=doc-${TARGET}-de \
    ALGOLIA_INDEX_FILE=index.de.json \
    npm run algolia
RUN ALGOLIA_APP_ID=GEETCE1DI1 \
    ALGOLIA_ADMIN_KEY=${KEY} \
    ALGOLIA_INDEX_NAME=doc-${TARGET}-en \
    ALGOLIA_INDEX_FILE=index.en.json \
    npm run algolia
