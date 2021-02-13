# Suppress default mode prompt
function fish_mode_prompt
end

function fish_prompt
    set_color brcyan
    echo -n (prompt_pwd)
    set_color normal

    if [ $fish_key_bindings = "fish_vi_key_bindings" ]
        switch $fish_bind_mode
            case "insert"
                set_color green
            case "default"
                set_color red
            case "visual"
                set_color yellow
            case "replace"
                set_color blue
        end
    end
    echo -n " ❯ "
    set_color normal
end
