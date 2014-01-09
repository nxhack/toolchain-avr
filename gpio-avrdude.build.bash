#!/bin/bash -ex

if [[ ! -d gpio-avrdude-1138 ]] ;
then
	svn co http://svn.savannah.nongnu.org/svn/avrdude/trunk/avrdude@1138 gpio-avrdude-1138
fi

cd gpio-avrdude-1138
for p in ../gpio-avrdude-patches/*.patch; do echo Applying $p; patch -p0 < $p; done
./bootstrap
cd -

mkdir -p objdir
cd objdir
PREFIX=`pwd`
cd -

mkdir -p gpio-avrdude-build
cd gpio-avrdude-build

CONFARGS=" \
	--prefix=$PREFIX \
        --enable-linuxgpio \
        --program-prefix=gpio-"

CFLAGS="-w $CFLAGS" CXXFLAGS="-w $CXXFLAGS" ../gpio-avrdude-1138/configure $CONFARGS

if [ -n "$MAKE_JOBS" ]; then
	MAKE_JOBS="2"
fi

nice -n 10 make -j $MAKE_JOBS

make install 