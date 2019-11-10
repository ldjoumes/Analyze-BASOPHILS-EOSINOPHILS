## AnalyzeBasophils-Eosiniphils
![doi](../master/Images/zenodo.3373938.svg?sanitize=true)
### Single regressions, and scatterplots for clinical bloodwork and gene expression data.
([AnalyzeBloodwork.R](../master/AnalyzeBloodwork.R)) will allow you to load a comma-delimited .csv with various datapoints, perform single regression of Body Mass Index (BMI) vs. Basophils (CBC-D) results, and produce 2-D scatterplots for the results. 

Data (RobinsonEtAl_Sup1.csv) was downloaded from: 

Robinson, JM. et al. 2019. Complete blood count with differential: An effective diagnostic for IBS subtype in the context of BMI? BioRxiv. doi: https://doi.org/10.1101/608208.

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

ggplot(IBS1, aes(x=BMI, y=Basophils)) +
  geom_point() +    
  geom_smooth(method=lm) 
```
```

```
![](fig_output/Rplot01.png)
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
##  Results of Eosinophils scatterplot
![](fig_output/Eosinophils_scatterplot.png)
![](fig_output/Rplot.png)

## Results of Basophils boxplot
![](fig_output/Basophils_boxplot.png)

## Results of Eosinophils Boxplot
![](fig_output/Eosinophils_boxplot.png)
## Results of Basophils scatterplot
![](fig_output/Basophils_scatterplot.png)

