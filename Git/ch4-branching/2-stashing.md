# Stashing

Git resets/overwritten working directory by checkout while switching branches, the unstaged or uncommitted changes get lost.

```
git stash push -m "message"
```
Above command saves the changes somewhere in safer place outside of the git history. As, stashing works similar to commiting, untracked files won't be included on stash. To include all files in stash use `--all` or `-a` flag or combining `-a -m`

```
git stash push -am "message here"
```

To list out all the stash

```
git stash list
```

To delete the stash from your repository, replace `stash@{0}` with the given id.

```
git stash drop stash@{0}
```

To show all the changes made, you can type only id `1` instead of `stash@{1}`

```
git stash show stash@{1}
```

To apply the changes in your working directory

```
git stash apply 1
```

OR, to delete all the stashes

```
git stash clear
```

----

[Branching](/Git/ch4-branching/README.md)

----