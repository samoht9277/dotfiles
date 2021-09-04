function purge
    sudo pacman -Rcns (pacman -Qdtq)
end