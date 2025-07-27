# Formatting the Log Output

The log message can be shown/print beautifully by formatting manually

```
git log --pretty=format:"%an committed %h on %cd"
```

**Note:** the flag `%an` for author's name, `%h` short hash, `%cd` committed date

We can change the color of output as well, for full list go to [Git Log](https://git-scm.com/docs/git-log)

# Creating Aliases

Aliases are useful if the command is long and have to use frequently, setup alias as follows.

```
git config --global alias.lg "log --pretty=format:'%an committed %H'"
```

Similarly, to restore all the files from staging area

```
git config --global alias.unstage "restore --staged ."
```

# Viewing a Commit

Commit can be shown using commit hash/id and HEAD pointer

```
git show HEAD~2
```

Above command tells, show the commit of given HEAD two step ahead from last commit.

To see the file which is changed

```
git show HEAD~2 --name-only
```

For details

```
git show HEAD~2 --name-status
```

# Viewing the Changes Across Commit

List all the changes within the commits

```
git diff HEAD~2 HEAD
```

To see the changes in specific file

```
git diff HEAD~2 HEAD <file_name>
```

Also can apply `--name-only` and `--name-status` command.

# Checking Out a Commit

If you want to restore to previous commit

```
git checkout 089a7d
```

When you checkout the specific commit, the HEAD points to that commit and master branch is at last commit. This case is called detached HEAD, because the HEAD is not at master branch.

To see all the commit so far when you're in detached head

```
git log --oneline --all
```

Now to point out HEAD to master

```
git checkout master
```

----

[Browsing History](/Git/ch3-browsing-history/README.md)

----