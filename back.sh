function __backup {
    for back in $@; do
        if [[ -f $back || -d $back ]]; then
            echo "work"
            path_base64=$(dirname "$back")
            backup_base64=$(echo "$back" | base64)
            echo $backup_base64
            echo $path_base64
        else
            echo "no found"
        fi
    done
}
