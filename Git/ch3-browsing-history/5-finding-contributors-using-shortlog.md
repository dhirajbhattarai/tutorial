# Finding Contributors Using Shortlog

People who have contributed to the projects

```
git shortlog
```

To see the number of commits of the author

```
git shortlog -n
```

Supress the summary and show email

```
git shortlog -n -s -e
```

Above command also use `--before` and `--after` options to filter commit also can find statistics using `--stat`

# Viewing the History of File

To find out how many commit have changes the certain file and add `--oneline` option for single line summary and if you want to see the actual content use `--patch`.

```
git log <file_name>
```

```
git log --oneline --patch <file_name>
```

# Restoring a Deleted File

First find out all the commits which have touched that file (discard double hyphen between the command and filename if no error occurs)

```
git log --oneline -- <file_name>
```

Now checkout the file from previous good commit

```
git checkout 09d3b4 <file_name>
```

# Blaming

To findout who have commited some bad file/code.

```
git blame <file_name>
```

If you want email address of the author, use `-e` flag and to see only few line (four line here)

```
git blame -e -L 1,4 <file_name>
```

# Tagging

Tagging is used to give name, for example versioning our project, to certain comit.

```
git tag v1.0
```

To tag previous commit, pass hash id with tag command

```
git tag v0.9 678d7e
```

Above is lightweight tag, for annotated tag, we have to pass some extra information as well.

```
git tag -a v1.2 -m "type your message"
```

List out all the tags using `git tag` and to show messages `git tag -n`

To delete the tags

```
git tag -d v1.0
```

**Note:** To see the browsing history using GUI tools in VSCode, install an extension Gitlens

----

[Browsing History](/Git/ch3-browsing-history/README.md)

----