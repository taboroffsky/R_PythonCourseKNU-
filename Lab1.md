#####
# 1. Створити змінні базових (atomic) типів
#####

doubleVar <- 1
typeof(doubleVar)

characterVar <- "a"
typeof(characterVar)

integerVar <- 5L
typeof(integerVar)

complexVar <- 2i
typeof(complexVar)

booleanVar <- TRUE
typeof(booleanVar)

#####
# 2. Створити вектори, які: містить послідовність з 5 до 75; містить числа 3.14, 2.71, 0, 13; 100 значень TRUE. 
#####

myVector <- 5:75
myVector

myVector <- c(3.14, 2.71, 0, 13)
myVector

myVector <- rep(TRUE, times=100)
myVector

#####
# 3. Створити наступну матрицю за допомогою matrix, та за допомогою cbind 
#####

myMatrix <- matrix(1:9, nrow = 4, ncol = 3)

myMatrix[1,1] <-0.5
myMatrix[1,2] <-1.3
myMatrix[1,3] <-3.5


myMatrix[2,1] <-3.9
myMatrix[2,2] <-131
myMatrix[2,3] <-2.8

myMatrix[3,1] <-0
myMatrix[3,2] <-2.2
myMatrix[3,3] <-4.6

myMatrix[4,1] <-2
myMatrix[4,2] <-7
myMatrix[4,3] <-5.1

myMatrix


column1 <- c(0.5, 3.9, 0, 2)
column2 <- c(1.3, 131, 2.2, 7)
column3 <- c(3.5, 2.8, 4.6, 5.1)

anotherMatrix <- cbind(column1, column2, column3)
anotherMatrix

#      column1 column2 column3
# [1,]     0.5     1.3     3.5
# [2,]     3.9   131.0     2.8
# [3,]     0.0     2.2     4.6
# [4,]     2.0     7.0     5.1

#####
# 4. Створити довільний список (list), в який включити всі базові типи. 
#####

myList <- list(booleanVar, characterVar, complexVar, doubleVar, integerVar)
myList

#####
# 5. Створити фактор з трьома рівнями «baby», «child», «adult». 
#####

myFactor <- factor(c("baby", "child", "child", "baby"), levels = c("baby", "child", "adult"))
str(myFactor)

#####
# 6. Знайти індекс першого значення NA в векторі 1, 2, 3, 4, NA, 6, 7, NA, 9, NA, 11. Знайти кількість значень NA. 
#####

data6 <- c(1, 2, 3, 4, NA, 6, 7, NA, 9, NA, 11)

match(NA, data6)

# [1] 5

numberOfNAElements <- length(data6[is.na(data6)])
numberOfNAElements

# [1] 3

#####
# 7. Створити довільний data frame та вивести в консоль. 
#####

myDataFrame <- data.frame("N" = 1:2, "Name" = c("Bob", "Stan"), "Weight" = c(78, 80))
myDataFrame

#N Name Weight
#1 1  Bob     78
#2 2 Stan     80

#####
# 8. Змінити імена стовпців цього data frame.
#####

names(myDataFrame) <- c("Order", "Customer", "Price")
myDataFrame

#   Order Customer Price
# 1     1      Bob    78
# 2     2     Stan    80