#!/bin/sh

M2=$HOME/.m2/repository
M2BACKUP=$HOME/.m2/repository-backup

case "$1" in
    remove)
        if [ -d "$M2BACKUP" ]; then
            if [ "$2" = "-f" ]; then
                rm -rf "$M2BACKUP"
            else
                echo "Previous backup found, use '-f' to overwrite it."
                exit 1
            fi
        fi
        mv "$M2" "$M2BACKUP"
        ;;
    restore)
        if [ -d "$M2BACKUP" ]; then
            rm -rf "$M2"
            mv "$M2BACKUP" "$M2"
        else
            echo "No previous backup found to restore."
            exit 1
        fi
        ;;
    *)
        echo "Usage: $0 <remove|restore> [-f]"
        exit 1
        ;;
esac

exit 0
