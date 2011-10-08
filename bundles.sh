#!/bin/sh

GIT_BUNDLES="
git://git.wincent.com/command-t.git
git://github.com/vim-scripts/FuzzyFinder.git
git://github.com/vim-scripts/L9.git
git://github.com/mileszs/ack.vim.git
git://github.com/tpope/vim-fugitive.git
git://github.com/sjl/gundo.vim.git
git://github.com/sjbach/lusty.git
git://github.com/tpope/vim-markdown.git
git://github.com/vim-scripts/minibufexplorerpp.git
git://github.com/scrooloose/nerdcommenter.git
git://github.com/scrooloose/nerdtree.git
git://github.com/tpope/vim-repeat.git
git://github.com/vim-scripts/scratch.vim.git
git://github.com/vim-scripts/slimv.vim.git
git://github.com/ervandew/supertab.git
git://github.com/tpope/vim-surround.git
git://github.com/scrooloose/syntastic.git
git://github.com/timcharper/textile.vim.git
git://github.com/tpope/vim-unimpaired.git
git://github.com/chrismetcalf/vim-yankring.git
git://github.com/vim-scripts/ZoomWin.git
"

# clone/update bundles from git
mkdir -p bundle
for i in $GIT_BUNDLES; do
  name=`echo $i | awk -F/ '{print $NF}' | awk -F.git '{print $1}'`
  if [ -d "bundle/$i" ]; then 
    (cd "bundle/$i" && git pull origin master)
  else
    (cd bundle && git clone $i)
  fi
done

# command-t ruby build
(cd bundle/command-t && rake make)

# python support in syntastic
# sudo pip install pyflakes
