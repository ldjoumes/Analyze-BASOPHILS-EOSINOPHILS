## BTEC395 S2020 GX Stephane Djoumessi

## Set working directory to source file location


## Read in the table of fold changes
FCdata <- read.csv("../data/FC.csv", row.names = 1, header = TRUE)

## Read in the table of expression data
IBS <- read.csv("../data/GXdata.csv", header = TRUE)

## Access only the columns with RNA Expression (subsetting)
names(IBS)[28:277]

## Make a list of anova(lm()) results for bloodwork parameter
## https://stats.stackexchange.com/questions/115304/interpreting-output-from-anova-when-using-lm-as-input
storage <- list()

for(i in names(IBS)[28:277]){
  storage[[i]]  <- anova(lm(get(i) ~ BasophilCount, IBS))
}

## Extract the p-values into a new list
## https://stackoverflow.com/questions/3366506/extract-p-value-from-aov
pVals <- list()

for(i in names(storage)){
  pVals[[i]] <- -(log10(storage[[i]]$'Pr(>F)'))
}

## Convert the pValues list into a data frame. 
## https://stackoverflow.com/questions/4227223/convert-a-list-to-a-data-frame
DFpvalues <- data.frame(matrix(unlist(pVals), nrow=length(pVals), byrow=T))

## Combine the results dataframes and write column labels
## https://www.statmethods.net/management/merging.html
## https://stackoverflow.com/questions/6081439/changing-column-names-of-a-data-frame
VolcanoPlotData <- cbind(FCdata, DFpvalues)
names(VolcanoPlotData)[1] <- paste("log2(FC)")
names(VolcanoPlotData)[2] <- paste("-log10(Pval)")

## Add a column to evaluate significance
## https://stackoverflow.com/questions/47764458/r-calculate-data-frame-and-assign-result-to-new-column
VolcanoPlotData$Sig <- ifelse(VolcanoPlotData$`-log10(Pval)` > 1.3, "Sig", "Insig");
  
#
install.packages("ggplot2")
library(ggplot2)
# library(ggrepel)

png("../fig_output/BasophilCountplot.png")
BasophilCountplot <- ggplot(VolcanoPlotData, aes(x = `log2(FC)`, y = `-log10(Pval)`, label=rownames(VolcanoPlotData), color=Sig)) +
  geom_point(aes(color = Sig)) +
  scale_color_manual(values = c("grey", "red")) +
  theme_bw(base_size = 12) + theme(legend.position = "bottom") +
  geom_text(aes(x = `log2(FC)`,y = `-log10(Pval)`, fontface = 1, size=3,  label=row.names(VolcanoPlotData)))

print(BasophilCountplot + ggtitle("Gene Expression vs. IL-10 Level"))
dev.off()



