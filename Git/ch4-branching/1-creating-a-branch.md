# Creating a Branch

Git branches are created to fix bugs or add some new features. We can create multiple branches and delete it when the job is done.

```
git branch bugfix
```

List all the branches using `git branch`, the branch with the asterisk `*` is the current working branch. (To see the current branch type `git status`)

# Switching Branch

To switch the branch we can use `git checkout` command as well as `git switch`

```
git switch bugfix
```

You can create and switch to that branch in a single command

```
git switch -C <branch_name>
```

# Renaming a Branch

Sometimes there are lots of bugs which have to be fixed, so the branch name must be clear. Let's change the `bugfix` branch to `bugfix/login-page` or `bugfix-login-page`.

```
git branch -m bugfix bugfix/login-page
```

# Deleting a Branch

After fixing the bugs and merging to the master branch.

```
git branch -d bugfix/login-page
```

**Note:** Sometimes you want to delete a branch without merging to master, in that case change the flag `-d` with `-D` to force delete.

# Comparing Branches

Before merging the changes to master we have to see the changes. To compare the changes between the branches.

```
git log master..bugfix/login-page
```

To show the actual changes use `--patch` flag on above command.

```
git diff master..bugfix/login-page
```

As we're in the master branch we can exclude it and type only `git diff bugfix/login-page` and to see only the file use `--name-only` or `--name-status` flag.

----

[Branching](/Git/ch4-branching/README.md)

----