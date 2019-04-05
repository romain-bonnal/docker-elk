#!/bin/bash

cd ../datas/redmine

# Redmine
curl -H 'Content-Type: application/x-ndjson' -XPOST 'localhost:9200/redmine/issues/_bulk?pretty' --data-binary @redmine-issues.json