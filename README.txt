The data explores the different tests and procedures used to detect Parkinsons Disease (PD). The data set has n=197 and 20 different variables.

Using Random Forest, it is possible to determine which variables are important in predicting if a patient has PD.

Through the variable importance plot, it is evident that the two tests with the highest GINI Coefficient are:

1: MDVP:Fo(Hz) - Average vocal fundamental frequency 
2: PPE - Three nonlinear measures of fundamental frequency variation

I also compared a decision tree using only the two important variables with the random forest.

Taking into consideration ONLY the two tests will yield 86% accuracy whereas all variables in the random forest yield 96% accuracy. 

This shows that all factors have importance, if there is a time and money constraint, focus should be put towards tests 1 and 2 as combined they account for a great deal of the diagnosis accuracy. 



