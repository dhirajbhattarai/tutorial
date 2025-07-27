# Finding Bugs using Bisect

For finding bugs quickly we use bisect because checking out all the commits is not possible. Point out the good and bad commit to find where the error has occured.

To find the bad commit

```
git bisect start
```

As we know the current commit is bad commit so,

```
git bisect bad
```

To point out the good commit

```
git bisect good 098e8d
```

Type following command until the bad commit is not occured

```
git bisect good
```

To reset the HEAD

```
git bisect reset
```

----

[Browsing History](/Git/ch3-browsing-history/README.md)

----