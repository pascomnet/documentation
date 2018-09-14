FROM node
CMD npm install webpack atomic-algolia
CMD ALGOLIA_APP_ID=GEETCE1DI1 \
    ALGOLIA_ADMIN_KEY=***REMOVED*** \
    ALGOLIA_INDEX_NAME=doc-dev \
    ALGOLIA_INDEX_FILE=index.de.json \
    npm run algolia
CMD ALGOLIA_APP_ID=GEETCE1DI1 \
    ALGOLIA_ADMIN_KEY=***REMOVED*** \
    ALGOLIA_INDEX_NAME=doc-dev \
    ALGOLIA_INDEX_FILE=index.en.json \
    npm run algolia
