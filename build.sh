#!/bin/sh

# Change this to build a different version of grep
DIFF_VER=3.7

wget http://ftp.gnu.org/gnu/diffutils/diffutils-${DIFF_VER}.tar.xz
tar xf diffutils-${DIFF_VER}.tar.xz
cd diffutils-${DIFF_VER}

# Static to avoid depending on libwinpthread-1.dll at runtime
mingw64-configure --disable-nls LDFLAGS="-static" CFLAGS="-DSIGSTOP=SIGINT -DSIGTSTP=SIGINT -DSIGALRM=SIGINT -DSIGHUP=SIGINT -DSIGQUIT=SIGINT -DSIGPIPE=SIGINT"

# Hack around error in gnulib-tests (which doesn't matter)
mv gnulib-tests gnulib-tests#
mkdir gnulib-tests
echo all: >gnulib-tests/Makefile

make

TARGET=../diffutils-${DIFF_VER}.zip
zip -j9 ${TARGET} */*.exe

# Display the results
echo
echo
echo Generated executable archive:
echo
ls -l ${TARGET}
unzip -l ${TARGET}
