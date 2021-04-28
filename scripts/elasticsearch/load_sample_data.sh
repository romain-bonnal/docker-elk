#!/bin/bash

cd ../datas/sample

# curl -H 'Content-Type: application/x-ndjson' -XPOST 'localhost:9200/golf/tournois/_bulk?pretty' --data-binary @tournois.json
# curl -H 'Content-Type: application/x-ndjson' -XPOST 'localhost:9200/bank/account/_bulk?pretty' --data-binary @accounts.json
# curl -H 'Content-Type: application/x-ndjson' -XPOST 'localhost:9200/shakespeare/doc/_bulk?pretty' --data-binary @shakespeare_6.0.json
# curl -H 'Content-Type: application/x-ndjson' -XPOST 'localhost:9200/_bulk?pretty' --data-binary @logs.jsonl

# Redmine
cd redmine
curl --user elastic:changeme -H 'Content-Type: application/x-ndjson' -XPOST 'localhost:9200/redmine/issues/_bulk?pretty' --data-binary @redmine.json
