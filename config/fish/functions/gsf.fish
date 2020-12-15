function gsf --description "View changes in git repository and view changes in file"
	git status -s | fzf -m --preview "bat --style changes --color=always {2}"
end

