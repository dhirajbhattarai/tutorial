# Merging

Git provides two types of merges
1. Fast-Forward Merges (if branch is linear)
2. 3-way Merges (if branch is diverged)

Before applying merges, see the log in graph form so that you can clearly visualize the branching history.

```
git log --oneline --all --graph
```

# Fast-Forward Merge

To apply merge, first switch to the branch where you want to apply merges (generally `master` or `main`).

```
git merge bugfix/login-page
```

**Note:** Fast-Forward merge has linear history, some people prefer it and some people discard it so that they can revert the changes easily if needed.

```
git merge --no-ff bugfix/login-page
```

**Note:** Disable Fast-Forward merge from your setting, `git config --global ff no` remove `--global` flag if you want changes only in current reposity.

# 3 Way Merges

This merge technique is applied when the changes/commits are not linear (when you make a commit in both master and other branch).

```
git merge bugfix/login-page
```

# View Merged and Unmerged Branches

To see all the branches which are merged into the current branch

```
git branch --merged
```

And to list out not-merged branches

```
git branch --no-merged
```

After merging the changes and there is no changes need to be added in that new branch, we should delete that branch.

# Merge Conflicts

When two branches have different changes in the same files, conflict occurs while merging the branch. In this case we have to change the conflict changes manually.

You can have multiple options if you encounter with merge conflicts

1. Choosing the current files contents
2. Choosing the merged files contents
3. Applying both contents

# Graphical Merge Tools

For graphical merge tools we can use P4Merge (there are many others), which will make it easy to compare and change the merge conflictions.

To use graphical tools, we need to configure the tools.

```
git config --global merge.tool p4merge
```

```
git config --global mergetool.p4merge.path "full_path_p4merge"  
```

# Aborting the Merge

To abort the merge and go back to previous commit

```
git merge --abort
```

# Undo the Faulty Merge

Sometimes merge can be unwanted or full of garbage, in that case we can revert the changes (undo the merge or reset).

There are three types of reset
1. Soft
2. Mixed
3. Hard

Let's do the hard reset to the previous commit

```
git reset --hard HEAD~1
```

To undo the reset, give previous commit id

```
git reset --hard 09d89e
```

Use revert command undo the merge commit.

```
git revert HEAD
```

If you encounter a problem while reverting, give the commit id in which you want to revert

```
git revert -m 1 HEAD
```

# Squash Merging

For a small bugfix and linear history, we can apply squash merge. (After merging to master, the branch must be deleted otherwise it is listed in `--no-merge`)

```
git merge --squash bugfix/page-problem
```

Squash only add the changes in staging area, so we have to commit it

```
git commit -m "a meaningful message"
```

----

[Branching](/Git/ch4-branching/README.md)

----