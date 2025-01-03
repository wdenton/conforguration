#!/bin/bash
unset R_VERSION
declare -a R_VERSION=( '4.4.2' )
cd $(dirname "$0")
SCRIPTS_DIR=$(pwd)
MIRROR="https://mirror.csclub.uwaterloo.ca/CRAN/"
cd /usr/local/src/R
if [ -d "/usr/local/src/R/R-${R_VERSION}" ]; then
  echo "Removing old source directory ..."
  rm -r R-${R_VERSION}
fi
if ! [ -f "R-${R_VERSION}.tar.gz" ]; then
  echo "Downloading R-${R_VERSION} tarball ..."
  R_MAJOR=${R_VERSION:0:1}
  curl -O $MIRROR/src/base/R-${R_MAJOR}/R-${R_VERSION}.tar.gz
else
  echo "Using existing R-${R_VERSION} tarball ..."
fi
echo "Uncompressing ..."
tar xzvf R-$R_VERSION.tar.gz

echo "Compiling ..."
cd R-$R_VERSION
./configure --enable-R-shlib
make && make check

unset R_VERSION
declare -a R_VERSION=( '4.4.2' )
cd /usr/local/src/R/
rm -f R Rscript
ln -s R-${R_VERSION}/bin/R R
ln -s R-${R_VERSION}/bin/Rscript Rscript

source ~/.bashrc

unset R_VERSION
declare -a R_VERSION=( '4.4.2' )
cd $SCRIPTS_DIR
./r-install-packages.sh
