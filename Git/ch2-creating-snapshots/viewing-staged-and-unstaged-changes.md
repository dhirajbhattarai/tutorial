# Viewing Staged and Unstaged Changes

To see the changes made in the files

```
git diff
```

```
git diff --staged
```

# Visual Diff Tools

There are multiple tools to see git diff, `KDiff3`, `P4Merge`, `WinMerge` for windows only and `VSCode`.

Setup the `VSCode` as your default git diff tools.

```
git config --global diff.tool vscode
```

Setup the command to launch VSCode for diff

```
git config --global difftool.vscode.cmd "code --wait --diff $LOCAL $REMOTE"
```

# Viewing History

To see the changes/commit history

```
git log
```

Short summary of history

```
git log --oneline
```

Reverse the history oldest to current

```
git log --oneline --reverse
```

# Viewing Commit

To view the commit

```
git show
```

Using unique commit id

```
git show 0d67
```

See the second last commit

```
git show HEAD~2
```

To see the changes contents

```
git show HEAD:<file_name>
```

```
git ls-tree HEAD
```

# Unstaging Files

To remove the files from staging area, we can unstage single, multiple as well as files with patterns.

```
git restore --staged <file_name>
```

# Discarding Local Changes

To restore the file in previous status

```
git restore <file_name>
```

To clean the whole directory or remove all the untracked files

```
git clean -f -d
```

**Warning:** This one is dangerous, use it wisely/carefully

# Restoring a File to an Earlier Version

In case you want to recover the files of previous commit

```
git restore --source=HEAD~1 <file_name>
```

----

[Creating Snapshots](/Git/ch2-creating-snapshots/README.md)

----