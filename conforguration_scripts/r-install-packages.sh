#!/bin/bash
script_dir='conforguration_scripts'
dotfiles_dir='dotfiles'
PACKAGE_LIST="tidyverse readxl devtools usethis remotes RCurl roxygen2 testthat lubridate shiny flexdashboard knitr ggvis \
xlsx lintr fs ggrepel ggridges hms docopt skimr\
arules arulesViz tm wordcloud cluster fpc topicmodels seriation igraph \
geonames maps mapproj rgeos sf maptools OpenStreetMap geosphere osmdata"
for PKG in $PACKAGE_LIST; do Rscript --vanilla -e "install.packages('$PKG', repos=c('https://utstat.toronto.edu/cran/'))"; done;
Rscript --vanilla -e "devtools::install_github('yorkulibraries/yulr')"
# Rscript --vanilla -e "devtools::install_github('tidyverse/hms')"
