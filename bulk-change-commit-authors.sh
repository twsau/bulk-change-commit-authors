#!/bin/sh
# delete ./.git/refs/original directory
# run chmod +x ./bulk-change-commits.sh to make the file executable

git filter-branch --env-filter '

OLD_EMAIL="OLD EMAIL"
CORRECT_NAME="CORRECT USER NAME"
CORRECT_EMAIL="CORRECT EMAIL"

if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags