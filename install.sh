#!/bin/bash
pushd /tmp
curl https://github.com/fabsor/mini-emacs/archive/master.tar.gz | tar -zxvf
popd;
pushd $HOME
if [ -d .emacs.d ]; then
  mv .emacs.d .emacs.d.old
fi
mv /tmp/mini-emacs-master .emacs.d
popd
