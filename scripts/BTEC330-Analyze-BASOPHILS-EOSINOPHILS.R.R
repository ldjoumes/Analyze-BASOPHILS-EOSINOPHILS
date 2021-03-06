## BTEC 330 R Project
## By Stephane Djoumessi
## set the woring directory before running the code. The directory is Analyze-BASOPHILS-EOSINOPHILS-master/Scripts

## Install necessary packages
install.packages("ggplot2")
library(ggplot2)

## Read data, refers the enire robinsonEtAl_sup1.csv file as IBS1
IBS1 <- read.csv("../data/RobinsonEtAl_Sup1.csv", header= TRUE)
head(IBS1)
write.csv(IBS1,"../data_output/output.csv")

## Assign "High", "Normal", or "Low" absed on clinical normal ranges of each variable: 
##https://idph.iowa.gov/Portals/1/Files/IMMTB/Complete%20Blood%20Count.pdf

## "High", "Normal", or "Low" of Basophils CBC
IBS1$Basophils_results <-"NA"
IBS1$Basophils_result[IBS1$Basophils > 0.02] <- "HIGH"
IBS1$Basophils_result[IBS1$Basophils <= 0.02 & IBS1$Basophils >= 0.002] <- "NORMAL"
IBS1$Basophils_result[IBS1$Basophils < 0.002] <- "LOW"

## "High", "Normal", or "Low" of Eosinophils CBC
IBS1$Eosinophils_results <-"NA"
IBS1$Eosinophils_result[IBS1$Eosinophils > 0.04] <- "HIGH"
IBS1$Eosinophils_result[IBS1$Eosinophils <= 0.04 & IBS1$Eosinophils >= 0.004] <- "NORMAL"
IBS1$Eosinophils_result[IBS1$Eosinophils < 0.004] <- "LOW"

##  Single Regressions for BMI vs. parameter, export scatterplot and boxplot  of the relatinoship between 2 variables.

## Run single regression BMI vs Basophils, Graphical analysis with ggplot 
single.regression <- lm(BMI ~ Basophils, data=IBS1)
print(single.regression)
df<-na.omit(data)
ggplot(IBS1, aes(x=BMI, y=Basophils)) +
  geom_point()+
  geom_smooth(method= lm)

## Run single regression BMI vs Eosinophils, Graphical analysis with ggplot 
single.regression <- lm(BMI ~ Eosinophils, data=IBS1)
print(single.regression)
df<-na.omit(data)
ggplot(IBS1, aes(x=BMI, y=Eosinophils)) +
  geom_point()+
  geom_smooth(method= lm)

## output the  Basophils results into a repository folder (data_output)
sink("../data_output/basophils_regression.txt")
print(single.regression)
sink() 

#### output the Eosinophils  results into a repository folder (data_output)
sink("../data_output/Eosinophils_regression.txt")
print(single.regression)
sink() 

## Produce an HD picture of the Basophils scatterplot and boxplot into fig_output folder
png("../fig_output/Basophils_scatterplot.png")
Basophils_scatterplot <- ggplot(IBS1, aes(x = BMI, y = Basophils)) +
  geom_point() +    
  geom_smooth(method = lm) 
print(Basophils_scatterplot)
dev.off()
png("../fig_output/Basophils_boxplot.png")
boxplot(Basophils ~ IBS.subtype, data = IBS1, main="Basophils by IBS1 subtype", 
        xlab = "IBS1.subtype", ylab = "Basophils",
        col=(c("pink","purple","blue"))
)
print("Basophils_boxplot")
dev.off()

## Produce an HD picture of the Eosinophils scatterplot and boxplot into fig_output folder
png("../fig_output/Eosinophils_scatterplot.png")
Eosinophils_scatterplot <- ggplot(IBS1, aes(x = BMI, y = Eosinophils)) +
  geom_point() +    
  geom_smooth(method = lm) 
print(Eosinophils_scatterplot)
dev.off()
png("../fig_output/Eosinophils_boxplot.png")
boxplot(Eosinophils ~ IBS.subtype, data = IBS1, main="Eosinophils by IBS1 subtype", 
        xlab = "IBS1.subtype", ylab = "Eosinophils",
        col=(c("yellow","brown","violet"))
)
print("Eosinophils_boxplot")
dev.off()

## ANOVA tests the level of variability and significance: IBS-subtype vs Basophils results into fig_output folder
Basophils.aov <- aov(Basophils ~ IBS.subtype, data=IBS1)
summary(Basophils.aov)
sink('../data_output/Basophils.txt', append = TRUE)
print(Basophils.aov)
sink()

## ANOVA tests the level of variability and significance: IBS-subtype vs Eosinophils results into fig_output folder
Eosinophils.aov <- aov(Eosinophils ~ IBS.subtype, data=IBS1)
summary(Eosinophils.aov)
sink('../data_output/Eosinophils.txt', append = TRUE)
print(Eosinophils.aov)
sink()
