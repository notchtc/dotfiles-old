function eds -d "View and edit files in the dotfiles folder"
    fd . ~/.dotfiles/ -t f | fzf -q "$argv" --prompt "edit: " --preview "bat --style plain --color=always {}" | xargs -ro nvim
end

