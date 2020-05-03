#!/bin/bash
set -e;

mongo <<EOF
use admin
db.createUser({
  user:  '$MONGO_NORMAL_USERNAME',
  pwd: '$MONGO_NORMAL_PASSWORD',
  roles: [{
    role: 'readWrite',
    db: '$MONGO_DEFAULT_DATABASE'
  }]
})
EOF