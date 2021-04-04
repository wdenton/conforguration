#!/bin/bash
PACKAGE_LIST="RCurl arules arulesViz cluster devtools docopt flexdashboard fpc fs geonames geosphere ggrepel ggridges ggvis hms igraph knitr lintr lubridate mapproj maps maptools osmdata readxl remotes rgeos roxygen2 seriation sf shiny skimr testthat tidyverse tm topicmodels usethis xlsx"
for PKG in $PACKAGE_LIST
do
    Rscript --vanilla -e "install.packages('$PKG', repos=c('https://utstat.toronto.edu/cran/'))"
done
Rscript --vanilla -e "devtools::install_github('yorkulibraries/yulr')"
