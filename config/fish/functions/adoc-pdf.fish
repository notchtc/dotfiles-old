function adoc-pdf --desc "See adoc file as pdf"
    asciidoctor-pdf -o - $argv | zathura -
end
