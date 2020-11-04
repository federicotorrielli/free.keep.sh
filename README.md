# `free.keep.sh` plugin for oh-my-zsh

[`free.keep.sh`](https://free.keep.sh) is an easy to use file sharing service from the command line, similar to transfer.sh

## Usage

Clone this repository to a local folder, like Downloads

Then execute this command in that folder: `mv free.keep.sh $ZSH_CUSTOM/plugins/keep`

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

