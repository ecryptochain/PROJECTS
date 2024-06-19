chooseCRANmirror()
# select a mirror site; a web site close to you.

setwd("~/documents/DS535")
# this is just an example, need to change the path
# set the working directory where the data file is located.

##### install packages to be used
install.packages("neuralnet")
install.packages("nnet")
install.packages("caret")

library(neuralnet)
library(nnet)
library(caret)

install.packages(c('neuralnet','keras','tensorflow'),dependencies = T)
library(tidyverse)
library(keras)


#####-- read in data 
#### Table 6.3
Retention.df<- read.csv(file="~/documents/DS535/dataset-22.csv")
View(Retention.df)
str(Retention.df)


# example: if y is not already 1,0 
summary(Retention.df)
Retention.df$Target <- ifelse(Retention.df$Target > 2 , 1, 0)  # this is just an example of the code
View(Retention.df)

#####  if you want to remove some columns
Retention.df <- Retention.df[ , -c(3, 5, 7)]  # Drop columns 3,5 and 7
View(Retention.df)
str(Retention.df)

###### normalizing the predictor variables in Retention.df (except the target Y variable)
###### may skip this step if don't want to normalize,
###### but normalization may makes the estimation runs faster
Retention.df[, c(1:10)]<-scale(Retention.df[,c(1:10)])
View(Retention.df)
str(Retention.df)


#### create two logical variables Target_1 and Target_0 based on Y to run NN model, they are added to the end of the data frame
####  logical variables has value True or False

Retention.df$Target_1 <- Retention.df$Target=="1"
Retention.df$Target_0 <- Retention.df$Target=="0"

# class( Retention.df$Target_1)
# class( Retention.df$Target_0)

View(Retention.df)
str(Retention.df)


####### partition data into training and validation
set.seed(2)   # random sample can be reproduced by setting a value for seed
train.index <- sample(c(1:dim(Retention.df)[1]), dim(Retention.df)[1]*0.6)    # dim(Retention.df)[1] gives the no. of obs.
train.df <- Retention.df[train.index, ]
valid.df <- Retention.df[-train.index, ]

str(train.df)
str(train.df)


#######   NN model estimation: Full model and Best model   ######
####### depends on the no. of X's and observations, may take a longer time
####### Target_1 and Target_0 are 2 logical classes; can extend to multi class

##### (1): Full model 
##### Full model with one layer and 2 neurons (for simplicity, can try more neurons)
##### Full model with all predictors may take a long time, and may not converge
nn <- neuralnet(Target_1 + Target_0 ~ . -Target , data = train.df, linear.output = F, hidden = 2)

### plot NN network
plot(nn, rep="best")

#### display NN weights
# names(nn)
nn$weights

### classification matrix: training data
pred <- predict(nn, train.df)

#### "pred" has 2 columns: prob in class 1; and prob in class 0
head(pred)
summary(pred)

### generate the classification matrix 
c.mat <- table(ifelse(pred[,1] > 0.5, 1, 0), train.df$Target)    #2 way table: row by column
c.mat   # row: predicted ;   column: actual 

sum(diag(c.mat))/sum(c.mat) # this gives accuracy: overall correct classification percentage 
c.mat[2,2]/sum(c.mat[,2])   # this gives True positive percentage, or sensitivity
c.mat[1,1]/sum(c.mat[,1])   # this gives True negatie percentage, or specificity

#### classification matrix: validation data
pred <- predict(nn, valid.df)

c.mat <- table(ifelse(pred[,1] > 0.5, 1, 0), valid.df$Target)    #2 way table: row by column
c.mat   # row: predicted ;   column: actual 

sum(diag(c.mat))/sum(c.mat) # this gives accuracy: overall correct classification percentage 
c.mat[2,2]/sum(c.mat[,2])   # this gives True positive percentage, or sensitivity
c.mat[1,1]/sum(c.mat[,1])   # this gives True negatie percentage, or specificity



####### (2): Best Model
### Use the Best X's selected in Report 3 (Logistic Regression) to run a NN model 
### the choice of X below is just an example, you need to select the best X's from Report 3
### 4 NN models are attempted below: one layer with 2, 5, 10 neurons; and two layers with 3,2 neurons
### you can try each and see if estimation converges, it takes longer to run for more complicated models

#  2a:  one layer 2 neurons
nn <- neuralnet(Target_1 + Target_0 ~ Tuition.fees.up.to.date
                + Scholarship.holder + Curricular.units.1st.sem..approved. + 
                  Curricular.units.2nd.sem..approved. , data = train.df, linear.output = F, hidden = 2)
#  2b:  one layer 5 neurons
nn <- neuralnet(Target_1 + Target_0 ~ Tuition.fees.up.to.date + Scholarship.holder + Curricular.units.1st.sem..approved. + 
                  Curricular.units.2nd.sem..approved. , data = train.df, linear.output = F, hidden = 5)
#  2c:  one layer 10 neurons
nn <- neuralnet(Target_1 + Target_0 ~ Tuition.fees.up.to.date
                + Scholarship.holder + Curricular.units.1st.sem..approved. + 
                  Curricular.units.2nd.sem..approved. , data = train.df, linear.output = F, hidden = 10)
#  2d:  two layers with 3, 2 neurons
nn <- neuralnet(Target_1 + Target_0 ~ Tuition.fees.up.to.date
                + Scholarship.holder + Curricular.units.1st.sem..approved. + 
                  Curricular.units.2nd.sem..approved. , data = train.df, linear.output = F, hidden = c(3,2)  )


# plot network
plot(nn, rep="best")

#### display NN weights
# names(nn)
nn$weights

##### classification matrix: training data
pred <- predict(nn, train.df)

head(pred)
summary(pred)

c.mat <- table(ifelse(pred[,1] > 0.5, 1, 0), train.df$Target)    #2 way table: row by column
c.mat   # row: predicted ;   column: actual 

sum(diag(c.mat))/sum(c.mat) # this gives accuracy: overall correct classification percentage 
c.mat[2,2]/sum(c.mat[,2])   # this gives True positive percentage, or sensitivity
c.mat[1,1]/sum(c.mat[,1])   # this gives True negatie percentage, or specificity


##### classification matrix: validation data
pred <- predict(nn, valid.df)

c.mat <- table(ifelse(pred[,1] > 0.5, 1, 0), valid.df$Target)    #2 way table: row by column
c.mat   # row: predicted ;   column: actual 

sum(diag(c.mat))/sum(c.mat) # this gives accuracy: overall correct classification percentage 
c.mat[2,2]/sum(c.mat[,2])   # this gives True positive percentage, or sensitivity
c.mat[1,1]/sum(c.mat[,1])   # this gives True negatie percentage, or specificity



