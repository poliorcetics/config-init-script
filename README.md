# Config Init Script

Source: https://www.atlassian.com/git/tutorials/dotfiles

This script is used by downloading and piping it to `sh`.

Raw github URLs look like this:

https://raw.githubusercontent.com/<username>/<repo>/<branch,commit,tag>/<path to file from git root>

So use something like:

```
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/poliorcetics/config-init-script/main/config-init-script.sh | sh
```
