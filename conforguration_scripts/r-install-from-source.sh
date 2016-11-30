#!/bin/bash
script_dir='conforguration_scripts'
dotfiles_dir='dotfiles'
unset R_VERSION
declare -a R_VERSION=( '3.3.2' )
cd /usr/local/src/R
curl -O https://cran.hafro.is/src/base/R-3/R-$R_VERSION.tar.gz
tar xzvf R-$R_VERSION.tar.gz
cd R-$R_VERSION
./configure
make && make check
cd ..
rm R Rscript
ln -s R-$R_VERSION/bin/R R
ln -s R-$R_VERSION/bin/Rscript Rscript
PACKAGE_LIST="dplyr readr tidyr ggplot2 devtools roxygen2 lubridate shiny knitr ggvis seriation igraph arules arulesViz tm wordcloud cluster fpc topicmodels"
for PKG in $PACKAGE_LIST; do ./Rscript --vanilla -e "install.packages('$PKG', repos=c('https://cran.hafro.is/'))"; done
./Rscript --vanilla -e "devtools::install_github('rstudio/shinyapps')"
