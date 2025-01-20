bspwm=$HOME/.config/bspwm
sxhkd=$HOME/.config/sxhkd
nvim=$HOME/.config/nvim

if [ -d "$bspwm" ]; then
    cat "Copiando as configs do bspwm"
    cp -r $bspwm .
    else
        cat "Diretório do bspwm não existe em .config"
fi

if [ -d "$sxhkd" ]; then
    cat "Copiando as configs do sxhkd"
    cp -r $sxhkd .
    else
        cat "Diretório do sxhkd não existe em .config"
fi


if [ -d "$nvim" ]; then
    cat "Copiando as configs do neovim"
    cp -r $nvim .
    else
        cat "Diretório do nvim não existe em .config"
fi


