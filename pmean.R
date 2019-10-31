###
# 1. Написати функцію pmean, яка обчислює середнє значення (mean)
# забруднення сульфатами або нітратами серед заданого переліка 
###

library("data.table")

pmean <- function(directory, pollutant, id = 1:332) {
  csvDataFiles <- paste0(directory, '/', formatC(id, width=3, flag="0"), ".csv" )
  
  dataRead <- lapply(csvDataFiles, data.table::fread)
  parsedList <- rbindlist(dataRead)
  
  if (c(pollutant) %in% names(parsedList)){
    return(parsedList[, lapply(.SD, mean, na.rm = TRUE), .SDcols = pollutant][[1]])
  } 
}

###
# 2. Написати функцію complete, яка виводить кількість
# повних спостережень (the number of completely observed cases)
# для кожного файлу. 
###

complete <- function(directory,  id = 1:332) {
  csvDataFiles <- paste0(directory, '/', formatC(id, width=3, flag="0"), ".csv" )
  
  dataRead <- lapply(csvDataFiles, data.table::fread)
  parsedList <- rbindlist(dataRead)
  
  return(parsedList[complete.cases(parsedList), .(nobs = .N), by = ID])
  
}

###
# 3. Написати функцію corr, яка приймає два аргументи:
# directory (папка, де знаходяться файли спостережень) та
# threshold (порогове значення, за замовчуванням дорівнює 0) та
# обчислює кореляцію між сульфатами та нітратами для моніторів,
# кількість повних спостережень для яких більше порогового значення.
# Функція повинна повернути вектор значень кореляцій.
# Якщо ні один монітор не перевищує порогового значення,
# функція повинна повернути numeric вектор довжиною 0.
###

corr <- function(directory, threshold = 0) {
  dataRead <- lapply(file.path(directory, list.files(path = directory, pattern="*.csv")), data.table::fread)
  parsedList <- rbindlist(dataRead)
  
  parsedList <- parsedList[complete.cases(parsedList),]
  
  parsedList <- parsedList[, .(nobs = .N, corr = cor(x = sulfate, y = nitrate)), by = ID][nobs > threshold]
  return(parsedList[, corr])
}
