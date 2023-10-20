#!/bin/bash
package_list="RCurl RSQLite arules arulesViz cluster dbplyr devtools docopt flexdashboard fpc fs geonames geosphere GGally ggrepel ggridges ggvis gmp gtools hms igraph knitr lintr lubridate mapproj maps maptools openxlsx osmdata readODS readxl remotes rgeos roxygen2 seriation sf shiny skimr testthat tidyverse tm topicmodels usethis xlsx"
for pkg in $package_list
do
    Rscript --vanilla -e "install.packages('$pkg', repos=c('https://mirror.csclub.uwaterloo.ca/CRAN/'))"
done
Rscript --vanilla -e "devtools::install_github('yorkulibraries/yulr')"
