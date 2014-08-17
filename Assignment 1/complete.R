complete <- function(directory, id = 1:332) {
  nobs <- vector()
  for (i in id) {
    if (i < 10)
      prefix <- '00'
    else if (i < 100)
      prefix <- '0'
    else
      prefix <- ''
    data <- read.csv(paste0(directory, '/', prefix, i, '.csv'))
    nobs <- c(nobs, dim(data[which(complete.cases(data)),])[1])
  }
  data.frame(id=id, nobs=nobs)
}
