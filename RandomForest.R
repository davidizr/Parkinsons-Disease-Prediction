#import libraries
library(tidyverse)
library(randomForest)
library(caTools)

#dataset from https://archive.ics.uci.edu/ml/datasets/parkinsons

#import data
set.seed(639)
data<-read.csv(file="/Users/david/Desktop/Code/R/Parkinsons Prediction/parkinsons.csv")%>%
  select(-c(name))%>%
  mutate(status=factor(status,
                       levels=c(0,1),
                       labels=c("negative","positive")))

#using 80/20 rule and taking 80% of the data to be used as training, rest is test
sample_data = sample.split(data, SplitRatio = 0.8)
train1 <- subset(data, sample_data == TRUE)
test1 <- subset(data, sample_data == FALSE)

#create random forest
rf<- randomForest(status~.,data=train1)

#Importance testing
varImpPlot(rf,main = "Random Forest Variable Importance")

#
p<-predict(rf,test1)
table(test1[,17],p)
mean(p==test1[,17])

