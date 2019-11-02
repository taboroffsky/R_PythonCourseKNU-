###
# 1. Створити матрицю mat з 5 стовпцями та 10 строками за допомогою matrix
# з випадковими даними (функція rnorm(50)). 
###

mat <- matrix(rnorm(50),10,5)
mat

###
# 2. Знайти максимальне значення в кожному стовпці. 
###

maxValuesPerColumn <- apply(mat, 2, max)
maxValuesPerColumn

###
# 3. Знайти середнє (mean) значення кожного стовпця. 
###

meanValuesPerColumn <- apply(mat, 2, mean)
meanValuesPerColumn

###
# 4. Знайти мінімальне значення в кожному рядку. 
###

minValuesPerRow <- apply(mat, 1, min)
minValuesPerRow

###
# 5. Відсортувати кожен стовбець таблиці. 
###

sortedColumns <- apply(mat, 2, sort)
sortedColumns

###
# 6. Знайти кількість значень < 0 для кожного стовпця. Використати свою функцію. 
###

countNegative <- function(x){
  return(length(x[x < 0]))
}

negativeCountPerColumn <- apply(mat, 2, countNegative)
negativeCountPerColumn

###
# 7. Вивести вектор з булевими значеннями TRUE та FALSE. TRUE, якщо в стовпці є елементи >2, FALSE – якщо немає. 
###

containsGreaterThan2 <- function(x){
  return(length(x[x > 2]) > 0)
}

columnContainsGreaterThan2Value <- apply(mat, 2, containsGreaterThan2)
columnContainsGreaterThan2Value

###
# 8. Створить список list1 <-  list(observationA = c(1:5, 7:3), observationB = matrix(1:6, nrow=2)).
# Для цього списку знайдіть sum за допомогою lapply. 
###

list1 <-  list(observationA = c(1:5, 7:3), observationB = matrix(1:6, nrow=2))
list1

list1Sum <- lapply(list1, sum)
list1Sum

###
# 9. Для кожного елементу списку list1 знайдіть максимальне та мінімальне значення (range)
# за допомогою lapply та sapply. 
###

list1Maxmin <- lapply(list1, range)
list1Maxmin

list1Maxmin <- sapply(list1, range)
list1Maxmin

###
# 10. Для вбудованого набору даних InsectSprays знайти середнє count для кожного spray. 
###

require(stats); require(graphics)
boxplot(count ~ spray, data = InsectSprays,
        xlab = "Type of spray", ylab = "Insect count",
        main = "InsectSprays data", varwidth = TRUE, col = "lightgray")
fm1 <- aov(count ~ spray, data = InsectSprays)

sprayCount <- count.fields(fm1)
sprayCount
