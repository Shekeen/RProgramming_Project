pollutantmean <- function(directory, pollutant, id=1:332) {
  pollutant_data <- vector()
  for (i in id) {
    if (i < 10)
      prefix <- '00'
    else if (i < 100)
      prefix <- '0'
    else
      prefix <- ''
    data <- read.csv(paste0(directory, '/', prefix, i, '.csv'))
    pollutant_data <- c(pollutant_data, data[,pollutant])
  }
  mean(pollutant_data, na.rm=T)
}