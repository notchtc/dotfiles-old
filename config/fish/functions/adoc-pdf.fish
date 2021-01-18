function adoc-pdf
    asciidoctor-pdf -o - $argv | zathura -
end
