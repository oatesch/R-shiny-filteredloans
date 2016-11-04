library('shiny')
library('digest')
library('dplyr')
library('ggplot2')
library('RColorBrewer')
library('plotly')

SHAloan <- character(1)
try(
  load("envir.Rdata")
)
SHAnow <- paste0(sha1('loandata.csv'), sha1('ui.R'), sha1('server.R'), sha1('import.R'), sha1('global.R'))

if(SHAloan !=  2){ #SHAnow){
  cat("File change detected, loading csv\n")
  cat("Saved hash: ",SHAloan,"\n")
  cat("Curr. hash: ",SHAnow,"\n")
  source('import.R')
} else {
  cat("Hashes match, using saved enviroment\n")
}