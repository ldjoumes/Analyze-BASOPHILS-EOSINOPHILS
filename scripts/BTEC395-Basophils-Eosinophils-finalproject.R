## BTEC395 S2020 Stephane Djoumessi

## install.packages("ggplot2")
library(ggplot2)

## Set working directory to setwd("C:/Users/loicd/Desktop/Analyze-BASOPHILS-EOSINOPHILS-master/scripts")

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
                   

## Recursive analysis for regression  - RNA Expression ##
View(IBS)

## Access only the columns with RNA Expression
names(IBS1)[37:286]

##  Make a data frame of list type
storage <- list()

## linear regression for each expressed gene
for(i in names(IBS1)[37:286]){
  storage[[i]]  <- lm(get(i) ~ Basophils..x10.9.cells.L., IBS1)
}

summary(storage$AGO2)
summary(storage$AGO2)$r.squared
summary(storage$AGO2)$coefficients[,4]

## output the results of the 250 genes in data_output folder
sink('../data_output/Basophils_storage.txt', append = TRUE)
print(storage)
sink()

## Access only the columns with RNA Expression (subsetting)
names(IBS)[28:277]

## Make a list of anova(lm()) results for BasophilCount parameter
storage <- list()

for(i in names(IBS)[28:277]){
  storage[[i]]  <- anova(lm(get(i) ~ BasophilCount, IBS))
}

## Extract the p-values into a new list
pVals <- list()

for(i in names(storage)){
  pVals[[i]] <- -(log10(storage[[i]]$'Pr(>F)'))
}

## Convert the pValues list into a data frame. 
DFpvalues <- data.frame(matrix(unlist(pVals), nrow=length(pVals), byrow=T))

## Combine the results dataframes and write column labels
VolcanoPlotData <- cbind(FCdata, DFpvalues)
names(VolcanoPlotData)[1] <- paste("log2(FC)")
names(VolcanoPlotData)[2] <- paste("-log10(Pval)")

## Add a column to evaluate significance
VolcanoPlotData$Sig <- ifelse(VolcanoPlotData$`-log10(Pval)` > 1.3, "Sig", "Insig");
  
#
install.packages("ggplot2")
library(ggplot2)
# library(ggrepel)

## output the result of the volcanoplot into fig_output data folder
png("../fig_output/BasophilCountplot.png")
BasophilCountplot <- ggplot(VolcanoPlotData, aes(x = `log2(FC)`, y = `-log10(Pval)`, label=rownames(VolcanoPlotData), color=Sig)) +
  geom_point(aes(color = Sig)) +
  scale_color_manual(values = c("grey", "red")) +
  theme_bw(base_size = 12) + theme(legend.position = "bottom") +
  geom_text(aes(x = `log2(FC)`,y = `-log10(Pval)`, fontface = 1, size=3,  label=row.names(VolcanoPlotData)))

print(BasophilCountplot + ggtitle("Gene Expression vs. BasophilCount Level"))
dev.off()

