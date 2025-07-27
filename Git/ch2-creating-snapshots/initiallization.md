# Initiallizing a Git Repository

Go to the project directory and iniatiallize the empty git repository in your local machine.

```
git init
```

# Staging Files to Git Repository

To track the changes, we have to add the files in staging area.

```
git add <file_name1>
```

```
git add <file_name_1> <file_name_2>
```

```
git add *.txt
```

```
git add .
```

All of the above are valide git command and perform similar task, first one add single given file, second command add multiple given file, third command add all the files having `.txt` extension and last one add all the files of current directory.

# Committing the Snapshots of Staging Area

In order to save the changes to git repository, we have to commit the snapshots of staging area.

```
git commit -m "Initial commit"
```
**Note:** `-m` flag stands for commit message, for long commit message execute following command.

```
git commit
```

**Note:** This will open the default code editor, where we can write our long commit message.

The commit should be done quite often with a meaningful message.

# Skipping the Staging Area

Sometime we can skip the staging and commit directly but be 100% sure before doing it.

```
git commit -a -m "Fixed the bug"
```

OR

```
git commit -am "Fixed the bug"
```

**Note:** `-a` flag stands for all

----

[Creating Snapshots](/Git/ch2-creating-snapshots/README.md)

----