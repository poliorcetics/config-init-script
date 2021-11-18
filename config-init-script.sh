# See README.md for source
mkdir -p "$HOME/.config/"
git clone --bare raw.githubusercontent.com/poliorcetics/bare-config.git "$HOME/.config/bare-config.git"
function config {
   git --git-dir="$HOME/.config/bare-config.git" --work-tree="$HOME" $@
}
mkdir -p "$HOME/.config.bak"
config checkout
if [[ $? -eq 0 ]]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} "$HOME/.config.bak/{}"
fi;
config checkout
config config status.showUntrackedFiles no

source "$HOME/.config/shells/common/install.sh"
