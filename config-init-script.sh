# See README.md for source
mkdir -p $HOME/.config/
git clone --bare raw.githubusercontent.com/poliorcetics/dotfiles.git $HOME/.config/bare-config.git
function config {
   git --git-dir=$HOME/.config/bare-config.git --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
