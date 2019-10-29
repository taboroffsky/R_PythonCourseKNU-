csvData <- read.csv(file="C:/hw1_data.csv", header=TRUE, sep=",")

###
# 1. Які назви стовпців файлу даних? 
###

colnames(csvData)

###
# 2. Виведіть перші 6 строк фрейму даних. 
###

head(csvData, 6)

###
# 3. Скільки спостерігань (строк) в дата фреймі? 
###

nrow(csvData)

###
# 4. Виведіть останні 10 строк дата фрейму. 
###

tail(csvData, 10)

###
# 5.Як багато значень «NA» в стовпці «Ozone»?
###

sum(is.na(csvData["Ozone"]))

###
# 6. Яке середнє (mean) стовпця «Ozone». Виключити «NA» значення. 
###

colMeans(csvData, na.rm = TRUE, dims = 1)["Ozone"]

###
# 7. Виведіть частину набору даних (subset) зі значенням «Ozone» > 31
# та «Temp» > 90. Яке середнє (mean) значень «Solar.R»
# в цьому наборі даних (subset)?
###

colMeans(subset(csvData, Ozone > 31 & Temp > 90))["Solar.R"]

###
# 8. Яке середнє значення (mean) для «Temp» для червня
# («Month» дорівнює 6)? 9
###

colMeans(subset(csvData, Month == 6))["Temp"]

###
# 9. Яке максимальне значення «Ozone» для травня («Month» дорівнює 5)?
###

max(subset(csvData, Month == 5)["Ozone"], na.rm = TRUE)
