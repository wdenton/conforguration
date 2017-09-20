#!/bin/bash
script_dir='conforguration_scripts'
dotfiles_dir='dotfiles'
unset R_VERSION
declare -a R_VERSION=( '3.4.1' )
cd /usr/local/src/R

# Wipe this version if it is there already
rm -rf R-$R_VERSION.tar.gz R-$R_VERSION

# Download and uncompress
curl -O https://cran.hafro.is/src/base/R-3/R-$R_VERSION.tar.gz
tar xzvf R-$R_VERSION.tar.gz

# Compile
cd R-$R_VERSION
./configure
make && make check

# Set up aliases
cd ..
rm R Rscript
ln -s R-$R_VERSION/bin/R R
ln -s R-$R_VERSION/bin/Rscript Rscript

# Install all the packages I want available by default
PACKAGE_LIST="tidyverse devtools RCurl roxygen2 testthat lubridate shiny flexdashboard knitr ggvis seriation igraph arules arulesViz tm wordcloud cluster fpc topicmodels"
for PKG in $PACKAGE_LIST; do ./Rscript --vanilla -e "install.packages('$PKG', repos=c('https://cran.hafro.is/'))"; done
## ./Rscript --vanilla -e "devtools::install_github('rstudio/shinyapps')"
./Rscript --vanilla -e "devtools::install_github('yorkulibraries/yulr')"
