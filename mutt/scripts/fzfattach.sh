#!/bin/bash
# cd to the root folder of attachments
# https://github.com/neomutt/neomutt/issues/1669
cd $HOME

# custom fd (fdfind on debian) for fzf, including only some extentions that I use as attachments
export FZF_DEFAULT_COMMAND='fdfind -t f -e pdf -e png -e jpg -e zip -e tar -e gz -e rar -e html -e md --absolute-path'

#attachment='fzf -m --prompt='Choose one/multiple file(s) to attach >' | \
#while IFS=$'\n' read -r attachment; do
#    echo "push 'a$attachment<enter>'"
#done
#attachment=`fzf -m`
#
#if [ "${#attachment}" -gt 1 ]; then
#  echo "push 'a$attachment<enter>'"
#else
#  # If you cancel fzf or choose an empty line
#  echo "echo 'No attachment selected'"
#fi

fzf -m --prompt='Choose one/multiple file(s) to attach >' | \
while IFS=$'\n' read -r attachment; do
  echo "push 'a$attachment<enter>'"
done
