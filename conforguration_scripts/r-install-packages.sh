#!/bin/bash
script_dir='conforguration_scripts'
dotfiles_dir='dotfiles'
PACKAGE_LIST="tidyverse readxl devtools RCurl roxygen2 testthat lubridate shiny flexdashboard knitr ggvis seriation igraph arules arulesViz tm wordcloud cluster fpc topicmodels xlsx lintr fs";
for PKG in $PACKAGE_LIST; do Rscript --vanilla -e "install.packages('$PKG', repos=c('https://cran.hafro.is/'))"; done;
Rscript --vanilla -e "devtools::install_github('yorkulibraries/yulr')"
Rscript --vanilla -e "devtools::install_github('docopt/docopt.R')"
Rscript --vanilla -e "devtools::install_github('tidyverse/hms')"
