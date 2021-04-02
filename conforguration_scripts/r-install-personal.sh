#!/bin/bash
script_dir='conforguration_scripts'
unset R_VERSION
declare -a R_VERSION=( '4.0.4' )
SCRIPTS_DIR=$PWD
MIRROR="https://utstat.toronto.edu/cran/"
cd /usr/local/src/R

# If the source has been untarred already, wipe that directory
# because we want to start fresh.
if [ -d "/usr/local/src/R/R-${R_VERSION}" ]; then
  echo "Removing old source directory ..."
  rm -r R-${R_VERSION}
fi

# If the source tarball is there, use it, otherwise download.
if ! [ -f "R-${R_VERSION}.tar.gz" ]; then
  echo "Downloading R-${R_VERSION} tarball ..."
  # Need to know the major version number, so we can get to e.g. base/R-4
  R_MAJOR=${R_VERSION:0:1}
  curl -O $MIRROR/src/base/R-${R_MAJOR}/R-${R_VERSION}.tar.gz
else
  echo "Using existing R-${R_VERSION} tarball ..."
  sleep 1
fi

# Now uncompress, configure and compile.
echo "Uncompressing ..."
tar xzvf R-$R_VERSION.tar.gz

echo "Compiling ..."
cd R-$R_VERSION
./configure --enable-R-shlib
make && make check

# Set up aliases
cd ..
rm -f R Rscript
ln -s R-${R_VERSION}/bin/R R
ln -s R-${R_VERSION}/bin/Rscript Rscript

source ~/.bashrc

cd $SCRIPTS_DIR
./r-install-packages.sh
