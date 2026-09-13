set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias la "ls -A"
alias lla "ll -A"
alias g git
alias pn pnpm
alias c code
alias o open
command -qv bat && alias cat bat
command -qv nvim && alias vim nvim
alias cc! "claude --dangerously-skip-permissions"

set -gx EDITOR nvim

# Path
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

set -gx PNPM_HOME "$HOME/Library/pnpm"
if not string match -q -- "$PNPM_HOME/bin" $PATH
    set -gx PATH "$PNPM_HOME/bin" $PATH
end

# Fzf
set -g fzf_preview_file_cmd 'bat --style=numbers --color=always --line-range=:500'
set -g FZF_LEGACY_KEYBINDINGS 0

# eza
if type -q eza
    alias ls "eza -l -g --icons=auto"
    alias lla "ll -a"
end

source ~/.orbstack/shell/init2.fish 2>/dev/null || :

command -qv zoxide && zoxide init fish | source

# Misc
set -gx SSH_AUTH_SOCK "$HOME/.bitwarden-ssh-agent.sock"
