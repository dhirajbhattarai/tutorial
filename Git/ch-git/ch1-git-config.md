# Git Config
Git config file is used to set and store the default values which are required to commit and push the code to the repository.

There are three places where we can store the settings/config values. `system`, `global` and `local`.

## Types of Git Config Files
Git uses three levels of config files, each affecting different scopes:

| Config Level | File Path | Scope |
| ------------ | --------- | ----- |
| **System**   | `/etc/gitconfig` or `C:\ProgramData\Git\config` | Affects all users on the system |
| **Global**   | `~/.gitconfig` or `~/.config/git/config`        | Affects the current user        |
| **Local**    | `.git/config` (inside a Git repo)               | Affects the specific repository |

Use the `--system`, `--global`, or `--local` flags with git config to set/view values at each level.

## Common Config Values in Git
Here are some of the most commonly used config options:

### Identity
```sh
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

### Editor
```sh
git config --global core.editor "code --wait"
```

### Line Endings (especially important on Windows)
```sh
git config --global core.autocrlf true      # Windows
git config --global core.autocrlf input     # Linux/Mac
git config --global core.autocrlf false     # Completely disable
```
**OS Differences:**

- Windows uses CRLF (\r\n)
        
        Converts LF → CRLF when checking out
        Converts CRLF → LF when committing

        Keeps repos clean with LF, but matches native CRLF in working directory

- Linux/macOS use LF (\n)
    
        Leaves line endings as-is when checking out

        Converts CRLF → LF when committing

        Keeps line endings LF everywhere

Mismatched line endings can cause unnecessary diffs or bugs, especially in shell scripts or code.

### Merge Tool
```sh
git config --global merge.tool vimdiff
```

### Alias (shortcuts for commands)
```sh
git config --global alias.st status
git config --global alias.co checkout
```

### Credential Storage
```sh
git config --global credential.helper cache      # Temporary
git config --global credential.helper store      # Plain text (not secure)
git config --global credential.helper manager    # Windows Credential Manager
```

### View All Git Configurations
```sh
git config --list --show-origin
```

---
**[Go Back](/git/README.md)**