#!/bin/bash

cd xkbcomp
./autogen.sh --datarootdir=$PREFIX/share --prefix=$PREFIX
make -j${CPU_COUNT}  install
cd ..

cd turbovnc
cmake -DTVNC_BUILDJAVA=OFF -DTVNC_BUILDNATIVE=OFF -DTVNC_NVCONTROL=OFF \
      -DTVNC_USEPAM=OFF -DCMAKE_EXE_LINKER_FLAGS=-liconv -DXKB_BASE_DIRECTORY=$PREFIX/share/X11/xkb \
      -DCMAKE_INSTALL_PREFIX=$PREFIX
cd ..
      