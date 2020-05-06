## BTEC395 S2020 Stephane Djoumessi

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
                   
                   
              ###   EOSINOPHILS ASSOCAITED GENES ###   

## ANOVA: IBS-subtype vs. SMPD3 GENE
SMPD3.aov <- aov(SMPD3 ~ IBSsubtype, data = IBS1)
summary(SMPD3.aov)
sink('../data_output/SMPD3.txt', append = TRUE)
print(SMPD3.aov)
sink()

## Print out a boxplot of SMPD3
png("../fig_output/SMPD3.png")
SMPD3_boxplot <- boxplot(SMPD3 ~ IBSsubtype, data = IBS1, main="SMPD3 by IBS subtype", 
                         xlab = "IBS.subtype", ylab = "SMPD3"
)
dev.off()


## ANOVA: IBS-subtype vs. PTGDR2 GENE
PTGDR2.aov <- aov(PTGDR2 ~ IBSsubtype, data = IBS1)
summary(PTGDR2.aov)
sink('../data_output/PTGDR2.txt', append = TRUE)
print(PTGDR2.aov)
sink()

## Print out a boxplot of PTGDR2
png("../fig_output/PTGDR2.png")
PTGDR2_boxplot <- boxplot(PTGDR2 ~ IBSsubtype, data = IBS1, main="PTGDR2 by IBS subtype", 
                          xlab = "IBS.subtype", ylab = "PTGDR2"
)
dev.off()

## ANOVA: IBS-subtype vs. THBS1 GENE
THBS1.aov <- aov(THBS1 ~ IBSsubtype, data = IBS1)
summary(THBS1.aov)
sink('../data_output/THBS1.txt', append = TRUE)
print(THBS1.aov)
sink()

## Print out a boxplot of THBS1
png("../fig_output/THBS1.png")
THBS1_boxplot <- boxplot(THBS1 ~ IBSsubtype, data = IBS1, main="THBS1 by IBS subtype", 
                         xlab = "IBS.subtype", ylab = "THBS1"
)
dev.off()

## ANOVA: IBS-subtype vs. IL5RA GENE
IL5RA.aov <- aov(IL5RA ~ IBSsubtype, data = IBS1)
summary(IL5RA.aov)
sink('../data_output/IL5R9.txt', append = TRUE)
print(IL5RA.aov)
sink()

## Print out a boxplot of IL5RA GENE
png("../fig_output/IL5RA.png")
IL5RA_boxplot <- boxplot(IL5RA ~ IBSsubtype, data = IBS1, main="IL5RA by IBS subtype", 
                         xlab = "IBS.subtype", ylab = "IL5RA"
)
dev.off()

## ANOVA: IBS-subtype vs. CCR3 GENE
CCR3 <- aov(CCR3 ~ IBSsubtype, data = IBS1)
summary(CCR3)
sink('../data_output/CCR3.txt', append = TRUE)
print(CCR3)
sink()

## Print out a boxplot of CCR3
png("../fig_output/CCR3.png")
CCR3_boxplot <- boxplot(CCR3 ~ IBSsubtype, data = IBS1, main="CCR3 by IBS subtype", 
                        xlab = "IBS.subtype", ylab = "CCR3"
)
dev.off()

        ###  BASOPHILS ASSOCAITED GENES  ###

## ANOVA: IBS-subtype vs. IL1A GENE
IL1A <- aov(IL1A ~ IBSsubtype, data = IBS1)
summary(IL1A)
sink('../data_output/IL1A.txt', append = TRUE)
print(IL1A)
sink()

## Print out a boxplot of IL1A
png("../fig_output/IL1A.png")
IL1A_boxplot <- boxplot(IL1A ~ IBSsubtype, data = IBS1, main="IL1A by IBS subtype", 
                        xlab = "IBS.subtype", ylab = "IL1A"
)
dev.off()

## ANOVA: IBS-subtype vs. IL2 GENE
IL2 <- aov(IL2 ~ IBSsubtype, data = IBS1)
summary(IL2)
sink('../data_output/IL2.txt', append = TRUE)
print(IL2)
sink()

## Print out a boxplot of IL2
png("../fig_output/IL2.png")
IL2_boxplot <- boxplot(IL2 ~ IBSsubtype, data = IBS1, main="IL2 by IBS subtype", 
                       xlab = "IBS.subtype", ylab = "IL2"
)
dev.off()

## ANOVA: IBS-subtype vs. IL7R GENE
IL7R <- aov(IL7R ~ IBSsubtype, data = IBS1)
summary(IL7R)
sink('../data_output/IL7R.txt', append = TRUE)
print(IL7R)
sink()

## Print out a boxplot of IL7R
png("../fig_output/IL7R.png")
IL7R_boxplot <- boxplot(IL7R ~ IBSsubtype, data = IBS1, main="IL7R by IBS subtype", 
                        xlab = "IBS.subtype", ylab = "IL7R"
)
dev.off()

## ANOVA: IBS-subtype vs. CXCR4 GENE
CXCR4 <- aov(CXCR4 ~ IBSsubtype, data = IBS1)
summary(CXCR4)
sink('../data_output/CXCR4.txt', append = TRUE)
print(CXCR4)
sink()

## Print out a boxplot of CXCR4
png("../fig_output/CXCR4.png")
CXCR4_boxplot <- boxplot(CXCR4 ~ IBSsubtype, data = IBS1, main="CXCR4 by IBS subtype", 
                         xlab = "IBS.subtype", ylab = "CXCR4"
)
dev.off()

## ANOVA: IBS-subtype vs. PDCD1LG2 GENE
PDCD1LG2 <- aov(PDCD1LG2 ~ IBSsubtype, data = IBS1)
summary(PDCD1LG2)
sink('../data_output/PDCD1LG2.txt', append = TRUE)
print(PDCD1LG2)
sink()

## Print out a boxplot of PDCD1LG2 
png("../fig_output/PDCD1LG2.png")
PDCD1LG2_boxplot <- boxplot(PDCD1LG2 ~ IBSsubtype, data = IBS1, main="PDCD1LG2 by IBS subtype", 
                            xlab = "IBS.subtype", ylab = "PDCD1LG2"
)
dev.off()


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
