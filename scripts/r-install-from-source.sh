#!/bin/bash
cd /usr/local/src/R
VERSION=3.3.0
curl -O http://cran.utstat.utoronto.ca/src/base/R-3/R-$VERSION.tar.gz
tar xzvf R-$VERSION.tar.gz
cd R-$VERSION
./configure
make && make check
cd ..
rm R Rscript
ln -s R-$VERSION/bin/R R
ln -s R-$VERSION/bin/Rscript Rscript
PACKAGE_LIST="dplyr readr tidyr ggplot2 devtools lubridate shiny knitr ggvis seriation igraph arules arulesViz tm wordcloud cluster fpc topicmodels"
for PKG in $PACKAGE_LIST; do ./Rscript --vanilla -e "install.packages('$PKG', repos=c('https://cran.hafro.is/'))"; done
./Rscript --vanilla -e "devtools::install_github('rstudio/shinyapps')"
