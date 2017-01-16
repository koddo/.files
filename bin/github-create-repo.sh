#!/usr/bin/env bash

## this script has an alias in .bashrc to make the cd command work outside of it
## alias whatever.sh='. ./whatever.sh'

## to delete a repo: $ curl -u koddo -X DELETE https://api.github.com/repos/koddo/the-repo-name


REPO_NAME="$1"
TOKEN=$(security -i find-generic-password -a 'koddo-create-repositories-token' -s github -w)

RESPONSE=$( \
            curl --include --write-out "\n%{http_code}" --silent --output - \
                 -u "koddo:$TOKEN" https://api.github.com/user/repos -d "{ \"name\" : \"$REPO_NAME\" }" \
        )
echo "$RESPONSE"

HTTP_CODE=$(echo "$RESPONSE" | tail -n1)
if [[ "$HTTP_CODE" != 201 ]] ; then
    exit 1
else
    git clone "git@github.com:koddo/$REPO_NAME.git"
    cd "$REPO_NAME"      
fi
    

