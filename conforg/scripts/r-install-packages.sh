#!/bin/bash
package_list="RCurl arules arulesViz cluster devtools docopt flexdashboard fpc fs geonames geosphere ggrepel ggridges ggvis hms igraph knitr lintr lubridate mapproj maps maptools osmdata readxl remotes rgeos roxygen2 seriation sf shiny skimr testthat tidyverse tm topicmodels usethis xlsx"
for pkg in $package_list
do
    Rscript --vanilla -e "install.packages('$pkg', repos=c('https://utstat.toronto.edu/cran/'))"
done
Rscript --vanilla -e "devtools::install_github('yorkulibraries/yulr')"
