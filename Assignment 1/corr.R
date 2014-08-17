corr <- function(directory, threshold = 0) {
  corrs <- vector()
  nobs <- complete(directory)
  for (id in nobs[nobs$nobs > threshold,]$id) {
    if (id < 10)
      prefix <- '00'
    else if (id < 100)
      prefix <- '0'
    else
      prefix <- ''
    data <- read.csv(paste0(directory, '/', prefix, id, '.csv'))
    corrs <- c(corrs, cor(data$sulfate, data$nitrate, use="na.or.complete"))
  }
  corrs
}