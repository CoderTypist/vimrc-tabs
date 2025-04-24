#!/bin/bash

VIMRC="/home/${USER}/.vimrc"

tabs() {
    local n=4
    if [[ "$#" -ge 1 ]]; then
        n="$1"
        if [[ ! "$n" =~ ^[0-9]+$ ]]; then
            echo "Error: tabs(): Invalid number of spaces: ${n}" >&2
            return 1
        fi  
    fi 

    printf ":set number\n"          >  "${VIMRC}" # show line numbers
    printf ":set ai\n"              >> "${VIMRC}" # auto-indentation
    printf ":set shiftwidth=${n}\n" >> "${VIMRC}" # indentation level is n spaces
    printf ":set noexpandtab\n"     >> "${VIMRC}" # do not expand a tab to use spaces
    printf ":set tabstop=${n}\n"    >> "${VIMRC}" # tabs occupy n spaces
    printf "\ntab set to an actual tab (${n} spaces)\n\n"
}

spaces() {
    local n=4
    if [[ "$#" -ge 1 ]]; then
        n="$1"
        if [[ ! "$n" =~ ^[0-9]+$ ]]; then
            echo "Error: spaces(): Invalid number of spaces: ${n}" >&2
            return 1
        fi
    fi

    printf ":set number\n"       >  "${VIMRC}" # show line numbers
    printf ":set ai\n"           >> "${VIMRC}" # auto-indentation
    printf ":set shiftwidth=4\n" >> "${VIMRC}" # indentation level is n spaces
    printf ":set expandtab\n"    >> "${VIMRC}" # expand tabs to use spaces
    printf ":set tabstop=${n}\n" >> "${VIMRC}" # tabs occupy n spaces
    printf "\ntab set to ${n} spaces\n\n"
}

vmake() {
    tabs > /dev/null && vim makefile && spaces > /dev/null
}

tabs_help() {
    echo ""
    echo "--- tabs.sh ---"
    echo ""
    echo "  Use spaces"
    echo -e "  \ttabs.sh --spaces [tabstop=4]"
    echo ""
    echo "  Use tabs"
    echo -e "  \ttabs.sh --tabs [tabstop=4]"
    echo ""
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    if [[ $# -lt 1 ]]; then
        tabs_help
        exit 1
    fi
    case "${1}" in
        spaces|--spaces|-s)
            spaces
            exit $?
            ;;
        tabs|--tabs|-t)
            tabs
            exit $?
            ;;
        help|--help|-h)
            tabs_help
            exit 0
            ;;
        *)
            tabs_help
            exit 1
            ;;
    esac
else
    alias makedit="vmake"
fi
