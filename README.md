# `free.keep.sh` plugin

[`free.keep.sh`](https://free.keep.sh) is an easy to use file sharing service from the command line, similar to transfer.sh

## Usage

Add the plugin file to $ZSH\_CUSTOM/plugins

Add `keep` to your plugins array in your zshrc file:
```zsh
plugins=(... keep)
```

Then you can:

- transfer a file:

```zsh
keep file.txt
```

- transfer a whole directory (it will be automatically compressed):

```zsh
keep directory/
```

