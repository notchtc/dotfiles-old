function setwal -d "Set wallpaper in awesomewm"
    rm ~/.cache/wall.png
    ln -s $argv ~/.cache/wall.png
end
