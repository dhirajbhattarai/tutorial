# Filtering the History

In real world project there might be thousands of commit so we have to filter using certain condition to get the desired results.

```
git log --oneline -3
```

This will show only the last 3 commit.

Filter all the commit made by an author "Dhiraj Bhattarai"

```
git log --author="Dhiraj Bhattarai"
```

Filter by date (before and after)

```
git log --oneline --after="2022-4-15"
```

We can simplify more with `yesterday` or `one week ago`

```
git log --after="two years ago"
```

Filter by contents (this is case sensetive)

```
git log --grep="FrontEnd"
```

```
git log -S"GREETINGS"
```

And if you want to see the actual contents, use `--patch` option with above command.

To filter the range of commits

```
git log --oneline f4654da..d6534ae
```

If you want to see the commit which has changed certain file (for example file.txt)

```
git log --oneline file.txt
```

If above command throws an error, separate command and file name with double hyphen

```
git log --oneline -- file.txt
```

**Note:** always place your command/option before the double-hyphen which separates the filename with command.

```
git log --oneline --patch -- file.txt
```

----

[Browsing History](/Git/ch3-browsing-history/README.md)

----