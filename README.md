# Dotfiles mk2: an exosuit

With a fresh, or even a janky, laptop:

## Quickstart

```
cd; mkdir setup
curl .../mac > mac
git clone thoughtbot/dotfiles and therealadam/dotfiles
env RCRC=$HOME/Setup/dotfiles-thoughtbot/rcrc rcup
# rcup
```

1. Clone [dotfiles](https://github.com/thoughtbot/dotfiles) and this repo
1a. Into ~/Setup ...may require an initial tweak of dotfiles-thoughtbot/rcrc to use ~/Setup or a one-off rcup invocation...
1b. e.g. `env RCRC=$HOME/Setup/dotfiles-thoughtbot/rcrc rcup`
2. Bootstrap via [laptop](https://github.com/thoughtbot/laptop)
3. Run `mac` again to pick up local customizations that are now symlinked
   `script/setup`

## Imploding an existing setup

```
# Uninstall Homebrew; download the script and run with --help if you like
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"

# ..extensively manually prune /usr/local

# Uninstall asdf
rm -rf ~/.asdf

# Uninstall mise...
```

## RCM cheatsheet

- Re-link all dotfiles: `rcup`
- Add a new dotfile: `mkrc <existing file>`

## Mise cheatsheet

https://mise.jdx.dev/tasks/toml-tasks.html
