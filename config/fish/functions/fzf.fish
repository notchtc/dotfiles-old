function fzf
	command fzf --color "16,border:#928374" --border sharp --preview-window sharp:wrap --layout=reverse-list --info inline $argv
end
