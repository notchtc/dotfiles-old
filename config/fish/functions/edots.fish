function edots
	fd . ~/.dotfiles/ -t f | fzf --ansi -m --prompt "edit: " --preview "bat --style plain --color=always {}" | xargs -r nvim
end
