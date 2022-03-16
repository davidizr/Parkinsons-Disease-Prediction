#import libraries
library(tidyverse)
library(rpart)
library(rpart.plot)
library(caTools)

#dataset from https://archive.ics.uci.edu/ml/datasets/parkinsons

#set seed and data preparation
set.seed(639)
data<-read.csv(file="/Users/david/Desktop/Code/R/Parkinsons Prediction/parkinsons.csv") %>%
  select(2,18,21,22,24)%>%
  mutate(status=factor(status,
                       levels=c(0,1),
                       labels=c("negative","positive")))
  #test names
  #select(c(MDVP:Fo(Hz),status,spread1,spread2,PPE)) 

#using 80/20 rule and taking 80% of the data to be used as training, rest is test
sample_data = sample.split(data, SplitRatio = 0.8)
train <- subset(data, sample_data == TRUE)
test <- subset(data, sample_data == FALSE)

#create decision tree
dtm<-rpart(status~., train)
rpart.plot(dtm)

#accuracy reading
p<-predict(dtm,test,type="class")
table(test[,2],p)
mean(p==test[,2])
