# Dotfiles mk2: an exosuit

With a fresh, or even a janky, laptop:

```
cd; mkdir setup
curl .../mac > mac
git clone thoughtbot/dotfiles and therealadam/powersuit
rcup
```
1. Clone [dotfiles](https://github.com/thoughtbot/dotfiles) and this repo
2. Bootstrap via [laptop](https://github.com/thoughtbot/laptop)
3. Run `mac` again to pick up local customizations that are now symlinked
4. Run keyboard setup: `git clone jasonrudolph/keyboard .keyboard` and run
   `script/setup`

## TODO

- a tasteful, but not overboard macOS setup
- atom package syncing

https://github.com/jasonrudolph/keyboard
https://twitter.com/panic/status/558389225612005376

## Imploding an existing setup

```
# Uninstall Homebrew; download the script and run with --help if you like
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
(extensively manually prune /usr/local)

# Uninstall rbenv
rm -rf ~/.rbenv
# Uninstall asdf

rm -rf ~/.asdf
```
