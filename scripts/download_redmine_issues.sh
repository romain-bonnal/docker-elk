#!/bin/bash

. .parameters

cd datas

echo ${REDMINE_PROTOCOL}
echo ${REDMINE_HOST}
echo ${REDMINE_API_KEY}

# Prepare
mkdir -p redmine
rm -rf redmine/*
cd redmine

# Récupéraation de la liste des tickets
limit=25
for ((offset=0; ; offset+=25)); do
    #get issues
    contents=$(curl --request GET --url "${REDMINE_PROTOCOL}://${REDMINE_HOST}/issues.json?offset=$offset&limit=$limit&status_id=*" --header "X-Redmine-API-Key: ${REDMINE_API_KEY}")

    # Extract id
    echo "$contents" | jq '.[]' | jq '.[].id' >> redmine-issues-ids

    # If last page break
    if jq -e '.issues | length == 0' >/dev/null; then
       break
    fi <<< "$contents"
done


# Création du fichier pour le bulk
touch redmine-issues.json
while read -r id
do
    echo "{\"index\":{\"_id\":\"$id\"}}" >> redmine-issues.json
    echo $(curl --request GET --url "${REDMINE_PROTOCOL}://${REDMINE_HOST}/issues/$id.json" --header "X-Redmine-API-Key:  ${REDMINE_API_KEY}") >> redmine-issues.json
done < redmine-issues-ids