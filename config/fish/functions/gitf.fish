function gitf
	git status -s | fzf -m --preview "bat --style changes --color=always {2}"
end

