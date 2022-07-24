1. delete ./.git/refs/original directory (if it exists)
2. copy / paste the following code into your project terminal, replacing `OLD_EMAIL`, `CORRECT_NAME` and `CORRECT_EMAIL` with your target values

```bash
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
```

3. run `git log` to review your changes
4. run `git push --force --tags origin 'refs/heads/*'` to update your remote repository