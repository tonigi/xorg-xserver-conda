#!/bin/bash

cd xkbcomp
./autogen.sh --datarootdir=$PREFIX/share --prefix=$PREFIX
make -j${CPU_COUNT}  install
cd ..

cd turbovnc
mkdir build
cd build
cmake -DTVNC_BUILDJAVA=OFF -DTVNC_BUILDNATIVE=OFF -DTVNC_NVCONTROL=OFF \
      -DTVNC_USEPAM=OFF -DCMAKE_EXE_LINKER_FLAGS=-liconv -DXKB_BASE_DIRECTORY=$PREFIX/share/X11/xkb \
      -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_INSTALL_SYSCONFDIR=$PREFIX/etc  \
      ..
make -j${CPU_COUNT} install
#chmod og-w $PREFIX/etc/turbovncserver-security.conf
rm $PREFIX/etc/turbovncserver-security.conf
cd ../..

cp $PREFIX/share/X11/xkb/rules/base $PREFIX/share/X11/xkb/rules/xorg
