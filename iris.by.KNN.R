#iris classifier by KNN

data(iris)
attach(iris)

keep <- c()
rm(list = setdiff(ls(),keep))

str(iris)
summary(iris)
dim(iris)
head(iris)
#use r random generator to mix things up randomly; set seed so that every time get the same result
set.seed(513)
random <- runif(nrow(iris))
order(random)
iris_r <- iris[order(random),]
head(iris_r, 10)
#create normalize function and apply
normalize <- function(x) {
  (x - min(x)) / (max(x) - min(x))
}
iris_n <- as.data.frame(lapply(iris_r[,c(1,2,3,4)], normalize))
summary(iris_n)
#create training and testing datasets
iris_train <- iris_n[1:130,]
iris_test <- iris_n[131:150,]
iris_train_target <- iris_r[1:130, 5]
iris_test_target <- iris_r[131:150, 5]

#load package to run KNN
require(class)
#determin K(make sure K odd #)
sqrt(nrow(iris))
#build KNN model
m1 <- knn(train = iris_train, test = iris_test, cl = iris_train_target, k = 13)
m1
#create a confusion matrix to visulize the correctness of our model
table(iris_test_target, m1)
