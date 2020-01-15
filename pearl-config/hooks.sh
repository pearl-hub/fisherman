
function post_install(){
    cd $PEARL_PKGDIR/module
    make
    fish -c "fisher update"
    return 0
}

function pre_remove(){
    local fish_plugins=$(fish -c "fisher list")
    [ -z "$fish_plugins" ] && return

    echo "$fish_plugins" | fish -c "fisher uninstall --force"
    return 0
}
