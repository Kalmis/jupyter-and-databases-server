#!/bin/bash
echo "$(date "+%Y-%m-%d_%H%M%S") Starting mongodb backup"
mongodump --host mongodb --username $MONGO_INITDB_ROOT_USERNAME --password $MONGO_INITDB_ROOT_PASSWORD --ssl --sslAllowInvalidCertificates --gzip --archive=/backups/$(date "+%Y-%m-%d_%H%M%S")_mongodb.archive