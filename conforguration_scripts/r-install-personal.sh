#!/bin/bash
script_dir='conforguration_scripts'
dotfiles_dir='dotfiles'
unset R_VERSION
declare -a R_VERSION=( '3.4.3' )
R_SRC=/usr/local/src/R
cd $R_SRC

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
cd $R_SRC
rm -f R Rscript
ln -s R-${R_VERSION}/bin/R R
ln -s R-${R_VERSION}/bin/Rscript Rscript

source ~/.bashrc
RSCRIPT=./Rscript

PACKAGE_LIST="tidyverse readxl devtools RCurl roxygen2 testthat lubridate shiny flexdashboard knitr ggvis seriation igraph arules arulesViz tm wordcloud cluster fpc topicmodels"
for PKG in $PACKAGE_LIST; do $RSCRIPT --vanilla -e "install.packages('$PKG', repos=c('https://cran.hafro.is/'))"; done
$RSCRIPT --vanilla -e "devtools::install_github('yorkulibraries/yulr')"
$RSCRIPT --vanilla -e "devtools::install_github('tidyverse/hms')"
