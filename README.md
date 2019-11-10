# Analyze-BASOPHILS-EOSINOPHILS Overview
Linear regression, One way-ANOVA, scatterplots, and Boxpplots for Basophils-Eosinophils parameter in the gene expression data.

## AnalyzeBasophils-Eosiniphils Significance and references
## <p align="center"> * Basophils* </p>
>## Basophils appear in many specific kinds of inflammatory reactions, particularly those that cause allergic symptoms. Basophils contain anticoagulant heparin, which prevents blood from clotting too quickly. They also contain the vasodilator histamine, which promotes blood flow to tissues. its normal rages is 0.002-0.02 μg/dL.

data was obtained from:
##https://idph.iowa.gov/Portals/1/Files/IMMTB/Complete%20Blood%20Count.pdf



 

Data (RobinsonEtAl_Sup1.csv) was downloaded from: 

Robinson, JM. et al. 2019. Complete blood count with differential: An effective diagnostic for IBS subtype in the context of BMI? BioRxiv. doi: https://doi.org/10.1101/608208.

## Basophils parameter

##
### Results of single regression, BMI x Basophils
```
> single.regression <- lm(BMI ~ Basophils, data=IBS1)
> print(single.regression)

Call:
lm(formula = BMI ~ Basophils, data = IBS1)

Coefficients:
(Intercept)    Basophils  
      27.22       -15.31  

```
```
ggplot(IBS1, aes(x=BMI, y=Basophils)) +
  geom_point() +    
  geom_smooth(method=lm) 
```
![BMI vs Basophils](fig_output/Basophils_scatterplot.png)

##
### Results of single regression, BMI x Eosinophils
```
> single.regression <- lm(BMI ~ Eosinophils, data=IBS1)
> print(single.regression)

Call:
lm(formula = BMI ~ Eosinophils, data = IBS1)

Coefficients:
(Intercept)  Eosinophils  
     26.362        3.091  

```
![BMI vs Eosinophils](fig_output/Eosinophils_scatterplot.png)

## Results of Basophils boxplot
![](fig_output/Basophils_boxplot.png)
##  Results of Eosinophils Boxplot
![](fig_output/Eosinophils_boxplot.png)

