FROM node
ARG TARGET
RUN npm install webpack atomic-algolia
RUN ALGOLIA_APP_ID=GEETCE1DI1 \
    ALGOLIA_ADMIN_KEY=***REMOVED*** \
    ALGOLIA_INDEX_NAME=doc-$TARGET \
    ALGOLIA_INDEX_FILE=index.de.json \
    npm run algolia
RUN ALGOLIA_APP_ID=GEETCE1DI1 \
    ALGOLIA_ADMIN_KEY=***REMOVED*** \
    ALGOLIA_INDEX_NAME=doc-$TARGET \
    ALGOLIA_INDEX_FILE=index.en.json \
    npm run algolia
