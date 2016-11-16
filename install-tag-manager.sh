#!/bin/sh
TEMPLATE_DIR="$HOME/.git_template"
HOOK_DIR="$TEMPLATE_DIR/hooks"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p $TEMPLATE_DIR $HOOK_DIR
git config --global init.templatedir $TEMPLATE_DIR

for file in "$DIR"/hook-*
do
    hook_name="${file##*/}"
    hook_name=$(echo $hook_name| cut -d"-" -f2-3)
    ln -sf $file $HOOK_DIR/$hook_name
done
ln -sf "$DIR"/ctags $HOOK_DIR/ctags
for hook in "$HOOK_DIR"/*
do
    chmod +x $hook
done
