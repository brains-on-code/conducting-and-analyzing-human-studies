#read data
DataR <- read_delim("C:/Users/Janet/Desktop/icse19-fmri-ml/reanalysis/Clone-Based and Interactive Recommendation for Modifying Pasted Code/DataR.csv", ";", escape_double = FALSE, trim_ws = TRUE)

#first the response times
#define data on which to test
CCDemonTLow <- as.numeric(unlist(DataR[DataR$Group == 'CCDemon','Tlow']))
CCDemonTMedium <- as.numeric(unlist(DataR[DataR$Group == 'CCDemon','Tmedium']))
CCDemonTHigh <- as.numeric(unlist(DataR[DataR$Group == 'CCDemon','Thigh']))
mean(CCDemonTLow) #77.9375
mean(CCDemonTMedium) #338.9375
mean(CCDemonTHigh) #244.375

MCIDiffTLow <- as.numeric(unlist(DataR[DataR$Group == 'MCIDiff','Tlow']))
MCIDiffTMedium <- as.numeric(unlist(DataR[DataR$Group == 'MCIDiff','Tmedium']))
MCIDiffTHigh <- as.numeric(unlist(DataR[DataR$Group == 'MCIDiff','Thigh']))
mean(MCIDiffTLow) #164.375
mean(MCIDiffTMedium) #361.5625
mean(MCIDiffTHigh) #341.875

#rerun the significance tests
wilcox.test(CCDemonTLow, MCIDiffTLow,paired = TRUE)
wilcox.test(CCDemonTMedium, MCIDiffTMedium,paired = TRUE)
wilcox.test(CCDemonTHigh, MCIDiffTHigh,paired = TRUE)

#result
#low: W = 37, p-value = 0.0006446; paired: V = 5.5, p-value = 0.001344
#medium: W = 116, p-value = 0.6647; paired: V = 71, p-value = 0.8999
#high: W = 77, p-value = 0.05691; paired: V = 23, p-value = 0.03817

#shapiro-Wilk test for normality
shapiro.test(CCDemonTLow)
#W = 0.91011, p-value = 0.1169

shapiro.test(CCDemonTMedium)
#W = 0.7682, p-value = 0.001062

shapiro.test(CCDemonTHigh)
#W = 0.95328, p-value = 0.5434

shapiro.test(MCIDiffTLow)
#W = 0.93265, p-value = 0.2684

shapiro.test(MCIDiffTMedium)
#W = 0.61701, p-value = 2.353e-05

shapiro.test(MCIDiffTHigh)
#W = 0.91927, p-value = 0.1642

#rerun correct tests#rerun the significance tests
t.test(CCDemonTLow, MCIDiffTLow,paired = TRUE)
#t = -3.9351, df = 21.771, p-value = 0.0007177; paired: t = -4.4739, df = 15, p-value = 0.0004459

t.test(CCDemonTHigh, MCIDiffTHigh,paired = TRUE)
#t = -1.9854, df = 29.991, p-value = 0.05631; paired: t = -2.115, df = 15, p-value = 0.05158

#two-way anova
complexityLevels <- c(rep('low', 16),rep('medium', 16),rep('high', 16),rep('low', 16),rep('medium', 16),rep('high', 16))
times <- c(CCDemonTLow,CCDemonTMedium,CCDemonTHigh,MCIDiffTLow,MCIDiffTMedium,MCIDiffTHigh)
groups <- c(rep('CCDemon', 48),rep('MCIDiff', 48))

#summarize data to vector
dataANOVA <- data.frame(times,complexityLevels,groups)

#test for variance homogeneity
library(car)
leveneTest(times ~ groups*complexityLevels, data=dataANOVA)

#look at data
str(dataANOVA)
#'data.frame':	96 obs. of  3 variables:
# $ times           : num  74 81 36 80 31 61 51 100 41 125 ...
# $ complexityLevels: Factor w/ 3 levels "high","low","medium": 2 2 2 2 2 2 2 2 2 2 ...
# $ groups          : Factor w/ 2 levels "CCDemon","MCIDiff": 1 1 1 1 1 1 1 1 1 1 ...

#visualize data with interaction plot
library(ggpubr)
ggline(dataANOVA, x = "complexityLevels", y = "times", color = "groups", add = c("mean_se", "dotplot"), palette = c("#00AFBB", "#E7B800"))

res.aov2 <- aov(times ~ complexityLevels * groups, data = dataANOVA)
summary(res.aov2)
#result
                        #Df  Sum Sq Mean Sq F value   Pr(>F) 
#complexityLevels         2  910085  455042  14.648 3.11e-06 ***
#groups                   1  113782  113782   3.663   0.0588 .  
#complexityLevels:groups  2   26135   13068   0.421   0.6579    
#Residuals               90 2795783   31064                     
#---
#Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1


##now the number of test case failures
#define data on which to test
CCDemonTLowFail <- as.numeric(unlist(DataR[DataR$Group == 'CCDemon','Tlow_1']))
CCDemonTMediumFail <- as.numeric(unlist(DataR[DataR$Group == 'CCDemon','Tmedium_1']))
CCDemonTHighFail <- as.numeric(unlist(DataR[DataR$Group == 'CCDemon','Thigh_1']))
mean(CCDemonTLowFail) #0
mean(CCDemonTMediumFail) #0.6875
mean(CCDemonTHighFail) #1.3125

MCIDiffTLowFail <- as.numeric(unlist(DataR[DataR$Group == 'MCIDiff','Tlow_1']))
MCIDiffTMediumFail <- as.numeric(unlist(DataR[DataR$Group == 'MCIDiff','Tmedium_1']))
MCIDiffTHighFail <- as.numeric(unlist(DataR[DataR$Group == 'MCIDiff','Thigh_1']))
mean(MCIDiffTLowFail) #0.0625
mean(MCIDiffTMediumFail) #1.375
mean(MCIDiffTHighFail) #0.5

#rerun the significance tests
wilcox.test(CCDemonTLowFail, MCIDiffTLowFail,paired = TRUE) #V = 0, p-value = 1
wilcox.test(CCDemonTMediumFail, MCIDiffTMediumFail,paired = TRUE) #V = 30, p-value = 0.8191
wilcox.test(CCDemonTHighFail, MCIDiffTHighFail,paired = TRUE) #V = 23, p-value = 0.1434


#reanalysis of failed test cases
Input =("
Frequency  Low  Medium   High
CCDemon      0      11     21
MCIDiff      1      22      8
")

dataFisher = as.matrix(read.table(textConnection(Input),
                   header=TRUE, 
                   row.names=1))
				   

results = pairwiseNominalIndependence(dataFisher,

                                 fisher = TRUE,

                                 gtest  = FALSE,

                                 chisq  = FALSE,
                                 digits = 3)
#result
#Fisher's Exact Test for Count Data

#data:  dataFisher
#p-value = 0.002307
#alternative hypothesis: two.sided

#comparing observed and expected frequencies per task category (by hand)
#low; chi^2 from Table: 3.84
lowComplObserved <- c(0,1)
lowComplExpected <- c((lowComplObserved[1] + lowComplObserved[2])/2,(lowComplObserved[1] + lowComplObserved[2])/2)
chiLow <- sum((lowComplExpected - lowComplObserved)^2/lowComplExpected)
#result: chi^2: 1

#medium
mediumComplObserved <- c(11,22)
mediumComplExpected <- c((mediumComplObserved[1] + mediumComplObserved[2])/2,(mediumComplObserved[1] + mediumComplObserved[2])/2)
chiMedium <- sum((mediumComplExpected - mediumComplObserved)^2/mediumComplExpected)
#result: chi^2: 3.667

#high
highComplObserved <- c(21,8)
highComplExpected <- c((highComplObserved[1] + highComplObserved[2])/2,(highComplObserved[1] + highComplObserved[2])/2)
chiHigh <- sum((highComplExpected - highComplObserved)^2/highComplExpected)
#result: chi^2: 5.828