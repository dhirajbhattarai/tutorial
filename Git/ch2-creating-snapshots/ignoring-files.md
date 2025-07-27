# Ignoring Files

To exclude the files and untrack their changes, git provides a special `.gitignore` file.

```
bin/
file.txt
*.bin
```

# Ignore Already Committed Files

If you accidently commit a file which should be included in the `.gitignore` file.

```
git rm --cached <file> -r
```
**Note:** `--cached` flag refers index (index is an old term for staging area) area and `-r` flag is added to remove file recursively.

# List Git Files

```
git ls-files
```

----

[Creating Snapshots](/Git/ch2-creating-snapshots/README.md)

----