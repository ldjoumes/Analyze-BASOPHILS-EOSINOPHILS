## Install necessary packages

install.packages("ggplot2")
library(ggplot2)
## Read data
IBS1 <- read.csv("RobinsonEtAl_Sup1.csv", header = TRUE)
head(IBS1)
write.csv(IBS1, "data_output/data.csv")
##  Single Regressions for BMI vs. Basophils
##  Data was obtained from Robinson, et al. 2019 (doi: https://doi.org/10.1101/608208)
##  https://statquest.org/2017/10/30/statquest-multiple-regression-in-r/
##  http://www.sthda.com/english/articles/40-regression-analysis/167-simple-linear-regression-in-r/
##  http://r-statistics.co/Linear-Regression.html

#BMI, Basophils
## Run single regression BMI vs Basophils, export scatterplot 
single.regression <- lm(BMI ~ Basophils, data=IBS1)
print(single.regression)
df<-na.omit(data)
ggplot(IBS1, aes(x=BMI, y=Basophils)) +
  geom_point()+
  geom_smooth(method= lm)

sink("data_output/basophils_regression.txt")
print(single.regression)
sink() 

png("fig_output/Basophils_scatterplot.png")
Basophils_scatterplot <- ggplot(IBS1, aes(x = BMI, y = Basophils)) +
  geom_point() +    
  geom_smooth(method = lm) 

print(Basophils_scatterplot)
dev.off()

boxplot(Basophils ~ IBS.subtype, data = IBS1, main="Basophils by IBS1 subtype", 
        xlab = "IBS1.subtype", ylab = "Basophils"
)

png("fig_output/Basophils_boxplot.png")
Basophils_boxplot <- boxplot(Basophils ~ IBS.subtype, data = IBS1, main="Basophils by IBS1 subtype", 
                       xlab = "IBS1.subtype", ylab = "Basophils"
)
print(Basophils_boxplot)
dev.off()


##  Single Regressions for BMI vs. Eosinophils
##  Data was obtained from Robinson, et al. 2019 (doi: https://doi.org/10.1101/608208)
##  https://statquest.org/2017/10/30/statquest-multiple-regression-in-r/
##  http://www.sthda.com/english/articles/40-regression-analysis/167-simple-linear-regression-in-r/
##  http://r-statistics.co/Linear-Regression.html

#BMI, Eosinophils
single.regression <- lm(BMI ~ Eosinophils, data=IBS1)
print(single.regression)
df<-na.omit(data)
ggplot(IBS1, aes(x=BMI, y=Eosinophils)) +
  geom_point()+
  geom_smooth(method= lm)

sink("data_output/Eosinophils_regression.txt")
print(single.regression)
sink() 

png("fig_output/Eosinophlis_scatterplot.png")
Eosinophils_scatterplot <- ggplot(IBS1, aes(x = BMI, y = Eosinophils)) +
  geom_point() +    
  geom_smooth(method = lm) 
print(Esoinophils_scatterplot)
dev.off()

boxplot(Eosinophils ~ IBS.subtype, data = IBS1, main="Eosinophils by IBS1 subtype", 
        xlab = "IBS1.subtype", ylab = "Eosinophils"
)
png("fig_output/Eosinophils_boxplot.png")
Eosinophils_boxplot <- boxplot(Eosinophils ~ IBS.subtype, data = IBS1, main="Eosinophils by IBS1 subtype", 
                             xlab = "IBS1.subtype", ylab = "Eosinophils"
)
print(Eosinophils_boxplot)
dev.off()




  


