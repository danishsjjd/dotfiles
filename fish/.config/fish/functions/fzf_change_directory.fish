function _fzf_change_directory
  fzf | read -l foo
  if test -n "$foo"
    builtin cd "$foo"
    commandline -f repaint
  else
    commandline ''
  end
end

function fzf_change_directory
  begin
    echo $HOME/.config
    find $(ghq root) -maxdepth 4 -type d -name .git | sed 's/\/\.git//'
    find . -maxdepth 1 -type d ! -name '.*' | sed "s#^\./#$PWD/#"
    find $HOME/Developer -mindepth 2 -maxdepth 2 -type d ! -name '.*'
  end | sed -e 's/\/$//' | awk '!a[$0]++' | _fzf_change_directory $argv
end
