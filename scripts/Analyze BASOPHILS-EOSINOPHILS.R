## Install necessary packages

install.packages("ggplot2")
library(ggplot2)
## Read data
IBS1 <- read.csv("RobinsonEtAl_Sup1.csv", header = TRUE)
head(IBS1)
##  Single Regressions for BMI vs. Basophils
##  Data was obtained from Robinson, et al. 2019 (doi: https://doi.org/10.1101/608208)
##  https://statquest.org/2017/10/30/statquest-multiple-regression-in-r/
##  http://www.sthda.com/english/articles/40-regression-analysis/167-simple-linear-regression-in-r/
##  http://r-statistics.co/Linear-Regression.html
##  Single Regressions for BMI vs. Eosinophils
##  Data was obtained from Robinson, et al. 2019 (doi: https://doi.org/10.1101/608208)
##  https://statquest.org/2017/10/30/statquest-multiple-regression-in-r/
##  http://www.sthda.com/english/articles/40-regression-analysis/167-simple-linear-regression-in-r/
##  http://r-statistics.co/Linear-Regression.html
single.regression <- lm(BMI ~ SerumCortisol, data=IBS1)
summary(single.regression)

summary(single.regression)
single.regression <- lm(BMI ~ CRP, data=IBS1)

summary(single.regression)

single.regression <- lm(BMI ~ ESR, data=IBS1)
summary(single.regression)

single.regression <- lm(BMI ~ PlateletCount, data=IBS1)
summary(single.regression)

single.regression <- lm(BMI ~ IgA, data=IBS1)
summary(single.regression)

single.regression <- lm(BMI ~ Eosinophils, data=IBS1)
summary(single.regression)
single.regression <- lm(BMI ~ Basophils, data=IBS1)
print(single.regression)


install.packages("car")
library(car)
install.packages("cardata")
library(carData)

data <- read.csv('RobinsonEtAl_Sup1.csv')
df<-na.omit(data)

#BMI, Basophils
single.regression <- lm(BMI ~ Basophils, data=IBS1)
print(single.regression)

ggplot(df, aes(x=BMI, y=Basophils)) +
  geom_point() +    
  geom_smooth(method=lm)
df<-na.omit(data)
#BMI, Eosinophils
single.regression <-lm(BMI ~ Eosinophils, data =IBS1)
print(single.regression)
ggplot(df,aes(x=BMI, y=Eosinophils)) +
geom_point() +
geom_smooth(method=lm)


  


