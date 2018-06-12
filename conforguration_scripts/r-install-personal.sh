#!/bin/bash
SCRIPTS_DIR=$PWD
cd /usr/local/src/R

# Do not: wipe this version if it is there already (just in case)
# rm -rf R-$R_VERSION.tar.gz R-$R_VERSION

if ! [ -d "/usr/local/src/R/R-${R_VERSION}" ]; then
  echo "Downloading and compiling R ..."
  sleep 1
  # Download and uncompress
  curl -O https://cran.hafro.is/src/base/R-3/R-${R_VERSION}.tar.gz
  tar xzvf R-$R_VERSION.tar.gz
  # Compile
  cd R-$R_VERSION
  ./configure
  make && make check
else
  echo "Using existing R-${R_VERSION} source ..."
  sleep 1
fi

# Set up aliases
cd ..
rm -f R Rscript
ln -s R-${R_VERSION}/bin/R R
ln -s R-${R_VERSION}/bin/Rscript Rscript

source ~/.bashrc

cd $SCRIPTS_DIR
./r-install-packages.sh
