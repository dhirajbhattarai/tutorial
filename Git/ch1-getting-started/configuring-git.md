# Git Configuration

Before we start using Git, we need to specify some configurations, such as:
- Name
- Email
- Default Editor
- Line Ending

 Which can be configure in 3 different level:

 - `System` for all users
 - `Global` for all repositories of the current user
 - `Local` for current repositories

#

```
git config --global user.name "Dhiraj Bhattarai"
```
**Note:** *the double quote `" "` is used to include the space in between the name.*

```
git config --global user.email test@email.com
```

```
git config --global core.editor "code --wait"
```
**Note:** *the `--wait` flag tells the terminal to wait until the code-editor is closed*

```
git config --global -e
```
**Note:** *this will open the `.gitconfig` file storing all the global configuration settings and `-e` flag opens a default editor to modify the specified config file*

The most important configuration we have to set is `line ending` because different operating systems ends line differently, in windows `\r\n` and in macOS/Linux `\n` where `\r` is `Carriage Return` and `\n` is `Line Feed`.

For macOS/Linux

```
git config --global core.autocrlf input
```

For Windows

```
git config --global core.autocrlf true
```

Where `autocrlf` means `auto-carriageReturn-lineFeed`.

---

[Getting Started](/Git/ch1-getting-started/README.md)

---