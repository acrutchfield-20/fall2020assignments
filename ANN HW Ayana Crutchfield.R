#This code produces an artificial neural network for 2016 World
#Happiness Data that I found on Kaggle.
library(readr)
X2016_worldhappiness_data <- read_csv("~/Documents/Anything GMU/STAT 515/2016_worldhappiness_data.csv")
View(X2016_worldhappiness_data)
X2016_worldhappiness_data

X2016_worldhappiness_data$AustraliaandNewZealand <- X2016_worldhappiness_data$Region =="Australia and New Zealand"
X2016_worldhappiness_data$CentralandEasternEurope <- X2016_worldhappiness_data$Region =="Central and Eastern Europe"
X2016_worldhappiness_data$EasternAsia <- X2016_worldhappiness_data$Region =="Eastern Asia"
X2016_worldhappiness_data$LatinAmericaandCarribean <- X2016_worldhappiness_data$Region =="Latin America and Carribean"
X2016_worldhappiness_data$MiddleEastandNorthernAfrica <- X2016_worldhappiness_data$Region =="Middle East and Northern Africa"
X2016_worldhappiness_data$NorthAmerica <- X2016_worldhappiness_data$Region =="North America"
X2016_worldhappiness_data$SoutheasternAsia <- X2016_worldhappiness_data$Region =="Southeastern Asia"
X2016_worldhappiness_data$SouthernAsia <- X2016_worldhappiness_data$Region =="Southern Asia"
X2016_worldhappiness_data$SubSaharanAfrica <- X2016_worldhappiness_data$Region =="Sub-Saharan Africa"
X2016_worldhappiness_data$WesternEurope <- X2016_worldhappiness_data$Region =="Western Europe"

X2016_worldhappiness_data.train.idx <- sample(x = nrow(X2016_worldhappiness_data), size = nrow(X2016_worldhappiness_data)*0.5)
X2016_worldhappiness_data.train <- X2016_worldhappiness_data[X2016_worldhappiness_data.train.idx,]
X2016_worldhappiness_data.valid <- X2016_worldhappiness_data[-X2016_worldhappiness_data.train.idx,]
X2016_worldhappiness_data

library(neuralnet)
X2016_worldhappiness_data.net <- neuralnet(AustraliaandNewZealand + CentralandEasternEurope + EasternAsia+ 
                    LatinAmericaandCarribean+ MiddleEastandNorthernAfrica + NorthAmerica + SoutheasternAsia
                    + SouthernAsia + SubSaharanAfrica + WesternEurope ~
                      Family + Freedom + Generosity, 
                      data=X2016_worldhappiness_data.train, hidden=c(10,10), rep = 5, err.fct = "ce", 
                      linear.output = F, lifesign = "minimal", stepmax = 1000000,
                      threshold = 0.001)

plot(X2016_worldhappiness_data.net, rep="best")

