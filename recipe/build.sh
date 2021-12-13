#!/bin/bash

mkdir other-depends
cd other-depends

git clone https://gitlab.freedesktop.org/xorg/lib//libxcvt.git --depth 1 --branch=libxcvt-0.1.0
cd libxcvt
meson --prefix $PREFIX --libdir $PREFIX/lib _build
ninja -C _build -j${FDO_CI_CONCURRENT:-4} install
cd ..
rm -rf libxcvt


git clone https://gitlab.freedesktop.org/xorg/app/xkbcomp.git --depth 1 --branch=xkbcomp-1.4.1
cd xkbcomp
./autogen.sh --datarootdir=$PREFIX/share --prefix=$PREFIX
make -j${FDO_CI_CONCURRENT:-4} install
cd ..
rm -rf xkbcomp

curl -L https://github.com/freedesktop/libfontenc/archive/refs/tags/libfontenc-1.1.3.tar.gz | tar -zxvf-
cd libfontenc-libfontenc-1.1.3
./autogen.sh --prefix=$PREFIX
make install
cd ..
rm -rf libfontenc-*

curl -L https://github.com/freedesktop/xorg-libXfont/archive/refs/tags/libXfont-1.5.2.tar.gz | tar -zxvf-
cd xorg-libXfont-libXfont-1.5.2
./autogen.sh --prefix=$PREFIX
make install
cd ..
# rm -rf xorg-libXfont-libXfont-1.5.2

