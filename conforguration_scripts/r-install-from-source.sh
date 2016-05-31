#!/bin/bash
script_dir='conforguration_scripts'
dotfiles_dir='dotfiles'
unset RVERSION
declare -a RVERSION=( '3.3.0' )
cd /usr/local/src/R
curl -O https://cran.hafro.is/src/base/R-3/R-$RVERSION.tar.gz
tar xzvf R-$RVERSION.tar.gz
cd R-$RVERSION
./configure
make && make check
cd ..
rm R Rscript
ln -s R-$RVERSION/bin/R R
ln -s R-$RVERSION/bin/Rscript Rscript
PACKAGE_LIST="dplyr readr tidyr ggplot2 devtools lubridate shiny knitr ggvis seriation igraph arules arulesViz tm wordcloud cluster fpc topicmodels"
for PKG in $PACKAGE_LIST; do ./Rscript --vanilla -e "install.packages('$PKG', repos=c('https://cran.hafro.is/'))"; done
./Rscript --vanilla -e "devtools::install_github('rstudio/shinyapps')"
