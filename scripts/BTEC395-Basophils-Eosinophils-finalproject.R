## BTEC395 S2020 Stephane Djoumessi

## install.packages("ggplot2")
install.packages("ggplot2")
library(ggplot2)

## Set working directory to setwd("C:/Users/loicd/Desktop/Analyze-BASOPHILS-EOSINOPHILS-master/scripts")

## Read data
IBS1 <- read.table("../data/IBSGXData.txt", sep = "\t", header = TRUE)
View(IBS1)

##  Eosinophils Single Regression Test VS DROSHA gene
Eosinophils.regression <- lm(DROSHA ~ Eosinophils..x10.9.cells.L. , data=IBS1)
summary(Eosinophils.regression)

## Basophils Single Regression Test VS DROSHA gene
Basophils.regression <- lm(DROSHA ~ Basophils..x10.9.cells.L.  , data=IBS1)
summary(Basophils.regression)

## Eosinophils Scatterplot VS DROSHA gene
ggplot(IBS1, aes(x=DROSHA, y=Eosinophils..x10.9.cells.L.)) +
  geom_point() +    
  geom_smooth(method=lm) 

## Basophils Scatterplot VS DROSHA gene
ggplot(IBS1, aes(x=DROSHA, y=Basophils..x10.9.cells.L.)) +
  geom_point() +    
  geom_smooth(method=lm)
                   

## Recursive analysis for regression  - RNA Expression ##
## Access only the columns with RNA Expression
names(IBS1)[37:286]

##  Make a data frame of list type
storage <- list()
storage2 <- list()

## linear regression for each expressed gene vs Basophils
for(i in names(IBS1)[37:286]){
  storage[[i]]  <- lm(get(i) ~ Basophils..x10.9.cells.L., IBS1)
}

## linear regression for each expressed gene vs Eosinophils
for(i in names(IBS1)[37:286]){
  storage2[[i]]  <- lm(get(i) ~ Eosinophils..x10.9.cells.L., IBS1)
}
summary(storage$AGO2)
summary(storage$AGO2)$r.squared
summary(storage$AGO2)$coefficients[,4]

## output the results of the 250 genes vs Basophils in data_output folder
sink('../data_output/BasophilsStorage.txt', append = TRUE)
print(storage)
sink()

## output the results of the 250 genes vs Eosinophils in data_output folder
sink('../data_output/EosinophilsStorage.txt', append = TRUE)
print(storage2)
sink()


## Read in the table of fold changes (FC.csv)
FCdata <- read.csv("../data/FC.csv", row.names = 1, header = TRUE)
FCdata2 <- read.csv("../data/FC.2.csv", row.names = 1, header = TRUE)

## Read in the table of expression data
IBS <- read.csv("../data/GXdata.csv", header = TRUE)

## Access only the columns with RNA Expression (subsetting)
names(IBS)[28:277]

## Make a list of anova(lm()) results for BasophilCount parameter
storage3 <- list()

for(i in names(IBS)[28:277]){
  storage3[[i]]  <- anova(lm(get(i) ~ BasophilCount, IBS))
}

## Make a list of anova(lm()) results for EosinophilCount parameter
storage4 <- list()

for(i in names(IBS)[28:277]){
  storage4[[i]]  <- anova(lm(get(i) ~ EosinophilCount, IBS))
}

## Extract the Basophil p-values into a new list (storage3)
pVals <- list()
for(i in names(storage3)){
  pVals[[i]] <- -(log10(storage3[[i]]$'Pr(>F)'))
}

## Extract the Eosinophil p-values  into a new list (storage4)
pVals2 <- list()

for(i in names(storage4)){
  pVals2[[i]] <- -(log10(storage4[[i]]$'Pr(>F)'))
}

# Convert the Basophil pValues list into a data frame. 
DFpvalues <- data.frame(matrix(unlist(pVals), nrow=length(pVals), byrow=T))

# Convert the Eosiniphil pValues list into a data frame. 
DFpvalues2 <- data.frame(matrix(unlist(pVals2), nrow=length(pVals2), byrow=T))

## Combine the results dataframes and write column labels: BasophilCount
VolcanoPlotData <- cbind(FCdata, DFpvalues)
names(VolcanoPlotData)[1] <- paste("log2(SlopeDiff)")
names(VolcanoPlotData)[2] <- paste("-log10(Pval)")

## Combine the results dataframes and write column labels: EsoinophilCount
VolcanoPlotData2 <- cbind(FCdata2, DFpvalues2)
names(VolcanoPlotData2)[1] <- paste("log2(SlopeDiff)")
names(VolcanoPlotData2)[2] <- paste("-log10(Pval)")


## Add a column to evaluate significance
VolcanoPlotData$Sig <- ifelse(VolcanoPlotData$`-log10(Pval)` > 1.3, "Sig", "Insig");
VolcanoPlotData2$Sig <- ifelse(VolcanoPlotData$`-log10(Pval)` > 1.3, "Sig", "Insig");
  
## Install necessary packages
library(ggplot2)
# library(ggrepel)

## output the result of the BasophilCount volcanoplot into fig_output data folder
png("../fig_output/BasophilCountplot.png")
BasophilCountplot <- ggplot(VolcanoPlotData, aes(x = `log2(SlopeDiff)`, y = `-log10(Pval)`, label=rownames(VolcanoPlotData), color=Sig)) +
  geom_point(aes(color = Sig)) +
  scale_color_manual(values = c("black", "red")) +
  theme_bw(base_size = 12) + theme(legend.position = "bottom") +
  geom_text(aes(x = `log2(SlopeDiff)`,y = `-log10(Pval)`, fontface = 1, size=3,  label=row.names(VolcanoPlotData)))

print(BasophilCountplot + ggtitle("Gene Expression vs. BasophilCount Level"))
dev.off()

## output the result of the EosinophilCount volcanoplot into fig_output data folder
png("../fig_output/EosinophilCountplot.png")
EosinophilCountplot <- ggplot(VolcanoPlotData2, aes(x = `log2(SlopeDiff)`, y = `-log10(Pval)`, label=rownames(VolcanoPlotData2), color=Sig)) +
  geom_point(aes(color = Sig)) +
  scale_color_manual(values = c("black", "red")) +
  theme_bw(base_size = 12) + theme(legend.position = "bottom") +
  geom_text(aes(x = `log2(SlopeDiff)`,y = `-log10(Pval)`, fontface = 1, size=3,  label=row.names(VolcanoPlotData2)))

print(EosinophilCountplot + ggtitle("Gene Expression vs. EosinophilCount Level"))
dev.off()

