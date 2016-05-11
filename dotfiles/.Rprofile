## Options for R

## See http://gettinggeneticsdone.blogspot.com.es/2013/07/customize-rprofile.html for more about this kind of thing
## Also https://stackoverflow.com/questions/1189759/expert-r-users-whats-in-your-rprofile

## Hard code an HTTPS repo for CRAN packages
r <- getOption("repos")
r["CRAN"] <- c("https://cran.hafro.is/")
options(repos = r)
rm(r)

## Junk fills up in this directory ... need to clean out the 0-byte files.
Sys.setenv(R_HISTSIZE='0')
sink(file = paste('~/R/history/r-log-', strftime(Sys.time(), '%F %H:%M:%OS9'), sep = ''), split=T)

## Automatically convert strings to factor variables in a data.frame?
options(stringsAsFactors = FALSE)

options(prompt="ℝ> ")
