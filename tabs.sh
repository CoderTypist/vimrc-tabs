#!/bin/bash

VIMRC="/home/$USER/.vimrc"

tabs() {
    printf ":set number\n"        > "$VIMRC" # show line numbers
    printf ":set ai\n"           >> "$VIMRC" # auto-indentation
    printf ":set shiftwidth=4\n" >> "$VIMRC" # indentation level is 4 spaces
    printf ":set noexpandtab\n"  >> "$VIMRC" # do not expand a tab to use spaces
    printf ":set tabstop=4\n"    >> "$VIMRC" # tabs occupy 4 spaces
    printf "\ntab set to an actual tab\n\n"
}

spaces() {
    printf ":set number\n"        > "$VIMRC" # show line numbers
    printf ":set ai\n"           >> "$VIMRC" # auto-indentation
    printf ":set shiftwidth=4\n" >> "$VIMRC" # indentation level is 4 spaces
    printf ":set expandtab\n"    >> "$VIMRC" # expand tabs to use spaces
    printf ":set tabstop=4\n"    >> "$VIMRC" # tabs occupy 4 spaces
    printf "\ntab set to four spaces\n\n"
}

vmake() {
    tabs > /dev/null && vim make && spaces > /dev/null
}
alias makedit="vmake"
