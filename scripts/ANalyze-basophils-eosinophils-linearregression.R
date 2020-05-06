## BTEC395 Stephane Djoumessi

## install.packages("ggplot2")
library(ggplot2)

## Set working directory 

## Read data
IBS1 <- read.table("../data/IBSGXData.txt", sep = "\t", header = TRUE)
View(IBS1)

##  Eosinophils Single Regression Test
Eosinophils.regression <- lm(DROSHA ~ Eosinophils..x10.9.cells.L. , data=IBS1)
summary(Eosinophils.regression)

## Basophils Single Regression Test
Basophils.regression <- lm(DROSHA ~ Basophils..x10.9.cells.L.  , data=IBS1)
summary(Basophils.regression)

## Eosinophils Scatterplot
ggplot(IBS1, aes(x=DROSHA, y=Eosinophils..x10.9.cells.L.)) +
  geom_point() +    
  geom_smooth(method=lm) 

## Basophils Scatterplot
ggplot(IBS1, aes(x=DROSHA, y=Basophils..x10.9.cells.L.)) +
  geom_point() +    
  geom_smooth(method=lm)
