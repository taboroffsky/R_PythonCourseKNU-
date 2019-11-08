###
# 1. Функція add2(x, y), яка повертає суму двох чисел.
###

add2 <- function(a, b){
  result <- a + b
}

x <- add2(3,4)
x
# [1] 7

###
# 2. Функція above(x, n), яка приймає вектор та число n,
# та повертає всі елементі вектору, які більше n.
# По замовчуванню n = 10. 
###

above <- function(x, n= 10){
  result <- x[x > n]
}

x <- above(c(5:15), 12)
x
# [1] 13 14 15

###
# 3.Функція my_ifelse(x, exp, n), яка приймає вектор x,
# порівнює всі його елементи за допомогою exp з n,
# та повертає елементи вектору, які відповідають умові expression.
# Наприклад, my_ifelse(x, “>”, 0) повертає всі елементи x, які більші 0.
# Exp може дорівнювати “<”, “>”, “<=”, “>=”, “==”.
# Якщо exp не співпадає ні з одним з цих виразів, повертається вектор x. 
###

my_ifelse <- function(x, exp, n){
  if (exp == "=="){
    result <- x[x==n]
  }
  else if (exp == ">"){
    result <- x[x>n]
  }
  else if (exp == "<"){
    result <- x[x<n]
  }
  else if (exp == ">="){
    result <- x[x>=n]
  }
  else if (exp == "<="){
    result <- x[x<=n]
  }
  else {
    result <- x
  }
}

x <- my_ifelse(c(1:10), ">", 3)
x
# [1]  4  5  6  7  8  9 10

###
# 4. Функція columnmean(x, removeNA), яка розраховує середнє значення
# (mean) по кожному стовпцю матриці, або data frame.
# Логічний параметр removeNA вказує, чи видаляти NA значення.
# По замовчуванню він дорівнює TRUE.
###

columnmean <- function(x, removeNA = TRUE){
  result <- apply(x, 2, mean)
}

column1 <- c(0.5, 3.9, 0, 2)
column2 <- c(1.3, 131, 2.2, 7)
column3 <- c(3.5, 2.8, 4.6, 5.1)

matrix <- cbind(column1, column2, column3)
matrix

x <- columnmean(matrix)
x
# column1 column2 column3 
# 1.600  35.375   4.000 