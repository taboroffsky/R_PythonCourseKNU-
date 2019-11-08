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

# [1] 0.6695946 0.9490888 1.6517483 1.3576036 0.7628311

###
# 3. Знайти середнє (mean) значення кожного стовпця. 
###

meanValuesPerColumn <- apply(mat, 2, mean)
meanValuesPerColumn

# [1] -0.22462490 -0.07123101 -0.07935414 -0.23609788 -0.06672265

###
# 4. Знайти мінімальне значення в кожному рядку. 
###

minValuesPerRow <- apply(mat, 1, min)
minValuesPerRow

#  [1] -2.0256182 -0.9146027 -2.0057670 -1.5767497 -0.4524152 -2.6515139 -1.7261268 -0.5180746
# [9] -0.9147462 -2.4686204

###
# 5. Відсортувати кожен стовбець таблиці. 
###

sortedColumns <- apply(mat, 2, sort)
sortedColumns

#              [,1]       [,2]       [,3]       [,4]        [,5]
# [1,] -2.65151388 -2.0256182 -2.4686204 -2.0057670 -0.91474618
# [2,] -0.84171480 -0.9146027 -1.5767497 -1.7261268 -0.73207863
# [3,] -0.45157338 -0.2321850 -1.2255972 -0.9526889 -0.45241523
# [4,] -0.40206886 -0.1962424 -0.5180746 -0.4174921 -0.27931952
# [5,]  0.02363643 -0.1793895 -0.1047343 -0.1931214 -0.16204620
# [6,]  0.06878708  0.1154238  0.1408553  0.1299298  0.02679084
# [7,]  0.36556410  0.2386684  0.5736458  0.2833984  0.25555094
# [8,]  0.47749149  0.6485820  1.2367540  0.3224029  0.30737752
# [9,]  0.49554814  0.8839645  1.4972314  0.8408826  0.52082888
# [10,]  0.66959465  0.9490888  1.6517483  1.3576036  0.76283110

###
# 6. Знайти кількість значень < 0 для кожного стовпця. Використати свою функцію. 
###

countNegative <- function(x){
  return(length(x[x < 0]))
}

negativeCountPerColumn <- apply(mat, 2, countNegative)
negativeCountPerColumn

# [1] 4 5 5 5 5

###
# 7. Вивести вектор з булевими значеннями TRUE та FALSE. TRUE, якщо в стовпці є елементи >2, FALSE – якщо немає. 
###

containsGreaterThan2 <- function(x){
  return(length(x[x > 2]) > 0)
}

columnContainsGreaterThan2Value <- apply(mat, 2, containsGreaterThan2)
columnContainsGreaterThan2Value

# [1] FALSE FALSE FALSE FALSE FALSE

###
# 8. Створить список list1 <-  list(observationA = c(1:5, 7:3), observationB = matrix(1:6, nrow=2)).
# Для цього списку знайдіть sum за допомогою lapply. 
###

list1 <-  list(observationA = c(1:5, 7:3), observationB = matrix(1:6, nrow=2))
list1

list1Sum <- lapply(list1, sum)
list1Sum

# $observationA
# [1] 40

# $observationB
# [1] 21

###
# 9. Для кожного елементу списку list1 знайдіть максимальне та мінімальне значення (range)
# за допомогою lapply та sapply. 
###

list1Maxmin <- lapply(list1, range)
list1Maxmin

# $observationA
#[1] 1 7

# $observationB
# [1] 1 6

list1Maxmin <- sapply(list1, range)
list1Maxmin

#      observationA observationB
# [1,]            1            1
# [2,]            7            6

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

# error