#!/bin/bash
pushd /tmp
https://codeload.github.com/fabsor/mini-emacs/tar.gz/master | tar -zxv
popd;
pushd $HOME
if [ -d .emacs.d ]; then
  mv .emacs.d .emacs.d.old
fi
mv /tmp/mini-emacs-master .emacs.d
popd
