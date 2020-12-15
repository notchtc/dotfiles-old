function eds --description "View and edit files in the dotfiles folder"
	fd . ~/.dotfiles/ -t f | fzf -m --prompt "edit: " --preview "bat --style plain --color=always {}" | xargs -ro nvim
end

