# Tutorial for mixed method ANOVA in R:
# https://datascienceplus.com/two-way-anova-with-repeated-measures/

#read data
AggregatedDataFirstRound <- read.csv("C:/Users/Janet/Desktop/fMRI-ML/ReanalyzeStudy/AnEmpiricalStudyOnTheImpactSfStaticTypingOnSoftwareMaintainability/AggregatedDataFirstRound.csv", sep=";")
View(RawDataFirstRound)

myData <- within(myData, {
  Subject <- factor(Subject)
  PL <- factor(PL)
  Task <- factor(Task)
})

myData <- myData[order(myData$Subject), ]
head(myData)

myData.mean <- aggregate(myData$Time,
                         by = list(myData$Subject, myData$PL,
                                 myData$Task),
                         FUN = 'mean')

colnames(myData.mean) <- c("Subject", "PL", "Task",
                           "Time")
myData.mean <- myData.mean[order(myData.mean$Subject), ]

Time.aov <- with(myData.mean, aov(Time ~ PL * Task 
                                    + Error(Subject /
                                    (Task))))
summary(Time.aov)
Time.aov

# Error: Subject
          # Df  Sum Sq Mean Sq F value Pr(>F)
# PL         1    1255    1255   0.007  0.934
# Residuals 31 5612400  181045               

# Error: Subject:Task
          # Df  Sum Sq Mean Sq F value   Pr(>F)    
# Task       2 4554686 2277343   26.28 5.43e-09 ***
# PL:Task    2 3926988 1963494   22.66 4.11e-08 ***
# Residuals 62 5373181   86664                     
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# > Time.aov

# Call:
# aov(formula = Time ~ PL * Task + Error(Subject/(Task)))

# Grand Mean: 814.9414

# Stratum 1: Subject

# Terms:
                     # PL Residuals
# Sum of Squares     1255   5612400
# Deg. of Freedom       1        31

# Residual standard error: 425.494
# 2 out of 3 effects not estimable
# Estimated effects are balanced

# Stratum 2: Subject:Task

# Terms:
                   # Task PL:Task Residuals
# Sum of Squares  4554686 3926988   5373181
# Deg. of Freedom       2       2        62

# Residual standard error: 294.3879
# Estimated effects may be unbalanced


# partial eta-squared:
# sum of squares of effects (SS effects) : 1255 + 4554686 + 3926988 = 8482929
# total sum of squares (SS total): 1255 + 4554686 + 3926988 + 5612400 + 5373181 = 19468510
# partial eta-squared for all effects: = SS effects / SS total = 8482929 / 19468510 = 0.436
# eta-squared for PL = SS PL / SS total = 1255 / 19468510 = 0.00006
# eta-squared for Tasks = SS Tasks / SS Total = 4554686 / 19468510 = 0.234
# eta-squared for PL:Task = SS Task:PL / SS Total = 3926988 / 19468510 = 0.202



AggregatedDataSecondRound <- read.csv("C:/Users/Janet/Desktop/fMRI-ML/ReanalyzeStudy/AnEmpiricalStudyOnTheImpactSfStaticTypingOnSoftwareMaintainability/AggregatedDataSecondRound.csv", sep=";")
View(RawDataSecondRound)

myData <- RawDataSecondRound
myData <- within(myData, {
  Subject <- factor(Subject)
  PL <- factor(PL)
  Task <- factor(Task)
})

myData <- myData[order(myData$Subject), ]
head(myData)

myData.mean <- aggregate(myData$Time,
                         by = list(myData$Subject, myData$PL,
                                 myData$Task),
                         FUN = 'mean')

colnames(myData.mean) <- c("Subject", "PL", "Task",
                           "Time")
myData.mean <- myData.mean[order(myData.mean$Subject), ]

Time.aov <- with(myData.mean, aov(Time ~ PL * Task 
                                    + Error(Subject /
                                    (Task))))
summary(Time.aov)
Time.aov


# Error: Subject
          # Df  Sum Sq Mean Sq F value   Pr(>F)    
# PL         1 5544897 5544897   27.83 9.76e-06 ***
# Residuals 31 6177225  199265                     
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# Error: Subject:Task
          # Df  Sum Sq Mean Sq F value   Pr(>F)    
# Task       2 1496833  748416   13.57 1.29e-05 ***
# PL:Task    2 3028308 1514154   27.45 2.89e-09 ***
# Residuals 62 3419686   55156                     
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# Call:
# aov(formula = Time ~ PL * Task + Error(Subject/(Task)))

# Grand Mean: 585.5374

# Stratum 1: Subject

# Terms:
                     # PL Residuals
# Sum of Squares  5544897   6177225
# Deg. of Freedom       1        31

# Residual standard error: 446.3914
# 2 out of 3 effects not estimable
# Estimated effects are balanced

# Stratum 2: Subject:Task

# Terms:
                   # Task PL:Task Residuals
# Sum of Squares  1496833 3028308   3419686
# Deg. of Freedom       2       2        62

# Residual standard error: 234.8536
# Estimated effects may be unbalanced

# partial eta-squared:
# sum of squares of effects (SS effects) : 5544897 + 1496833 + 3028308 = 10070038
# total sum of squares (SS total): 5544897 + 1496833 + 3028308 + 3419686 + 6177225 = 19666949
# partial eta-squared for all effects: = SS effects / SS total = 10070038 / 19666949 = 0.512
# eta-squared for PL = SS PL / SS total = 5544897 / 19666949 = 0.282
# eta-squared for Tasks = SS Tasks / SS Total = 1496833 / 19666949 = 0.076
# eta-squared for PL:Task = SS Task:PL / SS Total = 3028308 / 19666949 = 0.154


#Rerun the analysis on the raw data
RawDataRound1 <- read.csv("C:/Users/Janet/Desktop/fMRI-ML/ReanalyzeStudy/AnEmpiricalStudyOnTheImpactSfStaticTypingOnSoftwareMaintainability/RawDataRound1.csv", sep=";")
View(RawDataRound1)

myData <- RawDataRound1
myData <- within(myData, {
  Subject <- factor(Subject)
  PL <- factor(PL)
  Task <- factor(Task)
})

myData <- myData[order(myData$Subject), ]
head(myData)

myData.mean <- aggregate(myData$Time,
                         by = list(myData$Subject, myData$PL,
                                 myData$Task),
                         FUN = 'mean')

colnames(myData.mean) <- c("Subject", "PL", "Task",
                           "Time")
myData.mean <- myData.mean[order(myData.mean$Subject), ]

Time.aov <- with(myData.mean, aov(Time ~ PL * Task 
                                    + Error(Subject /
                                    (Task))))
summary(Time.aov)
Time.aov

# Error: Subject
          # Df   Sum Sq Mean Sq F value Pr(>F)
# PL         1    50193   50193   0.089  0.768
# Residuals 31 17567866  566705               

# Error: Subject:Task
           # Df   Sum Sq Mean Sq F value   Pr(>F)    
# Task        8 18916635 2364579  11.402 9.39e-14 ***
# PL:Task     8 11365296 1420662   6.851 3.90e-08 ***
# Residuals 248 51429201  207376                     
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# > Time.aov

# Call:
# aov(formula = Time ~ PL * Task + Error(Subject/(Task)))

# Grand Mean: 858.8013

# Stratum 1: Subject

# Terms:
                      # PL Residuals
# Sum of Squares     50193  17567866
# Deg. of Freedom        1        31

# Residual standard error: 752.7984
# 8 out of 9 effects not estimable
# Estimated effects are balanced

# Stratum 2: Subject:Task

# Terms:
                    # Task  PL:Task Residuals
# Sum of Squares  18916635 11365296  51429201
# Deg. of Freedom        8        8       248

# Residual standard error: 455.3853
# Estimated effects may be unbalanced

# partial eta-squared:
# sum of squares of effects (SS effects) : 50193 + 18916635 + 11365296 = 30332124
# total sum of squares (SS total): 50193 + 18916635 + 11365296 + 17567866 + 51429201 = 99329191
# partial eta-squared for all effects: = SS effects / SS total = 30332124 / 99329191 = 0.305
# eta-squared for PL = SS PL / SS total = 50193 / 99329191 = 0.0005
# eta-squared for Tasks = SS Tasks / SS Total = 18916635 / 99329191 = 0.190
# eta-squared for PL:Task = SS Task:PL / SS Total = 11365296 / 99329191 = 0.114


#Rerun the analysis on the raw data
RawDataRound2 <- read.csv("C:/Users/Janet/Desktop/fMRI-ML/ReanalyzeStudy/AnEmpiricalStudyOnTheImpactSfStaticTypingOnSoftwareMaintainability/RawDataRound2.csv", sep=";")
View(RawDataRound2)

myData <- RawDataRound2
myData <- within(myData, {
  Subject <- factor(Subject)
  PL <- factor(PL)
  Task <- factor(Task)
})

myData <- myData[order(myData$Subject), ]
head(myData)

myData.mean <- aggregate(myData$Time,
                         by = list(myData$Subject, myData$PL,
                                 myData$Task),
                         FUN = 'mean')

colnames(myData.mean) <- c("Subject", "PL", "Task",
                           "Time")
myData.mean <- myData.mean[order(myData.mean$Subject), ]

Time.aov <- with(myData.mean, aov(Time ~ PL * Task 
                                    + Error(Subject /
                                    (Task))))
summary(Time.aov)
Time.aov

# Error: Subject
          # Df   Sum Sq  Mean Sq F value  Pr(>F)    
# PL         1 18350636 18350636   42.54 2.8e-07 ***
# Residuals 31 13373979   431419                    
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# Error: Subject:Task
           # Df   Sum Sq Mean Sq F value   Pr(>F)    
# Task        8 10930598 1366325    9.91 5.90e-12 ***
# PL:Task     8  7114916  889365    6.45 1.27e-07 ***
# Residuals 248 34193721  137878                     
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# > Time.aov

# Call:
# aov(formula = Time ~ PL * Task + Error(Subject/(Task)))

# Grand Mean: 638.4613

# Stratum 1: Subject

# Terms:
                      # PL Residuals
# Sum of Squares  18350636  13373979
# Deg. of Freedom        1        31

# Residual standard error: 656.8247
# 8 out of 9 effects not estimable
# Estimated effects are balanced

# Stratum 2: Subject:Task

# Terms:
                    # Task  PL:Task Residuals
# Sum of Squares  10930598  7114916  34193721
# Deg. of Freedom        8        8       248

# Residual standard error: 371.3191
# Estimated effects may be unbalanced

# partial eta-squared:
# sum of squares of effects (SS effects) : 18350636 + 10930598 + 7114916 = 36396150
# total sum of squares (SS total): 18350636 + 10930598 + 7114916 + 13373979 + 34193721 = 83963850
# partial eta-squared for all effects: = SS effects / SS total = 36396150 / 83963850 = 0.433
# eta-squared for PL = SS PL / SS total = 18350636 / 83963850 = 0.219
# eta-squared for Tasks = SS Tasks / SS Total = 10930598 / 83963850 = 0.130
# eta-squared for PL:Task = SS Task:PL / SS Total = 7114916 / 83963850 = 0.085

RawDataRoundWithin <- read.csv("C:/Users/Janet/Desktop/fMRI-ML/ReanalyzeStudy/AnEmpiricalStudyOnTheImpactSfStaticTypingOnSoftwareMaintainability/RawDataWithinSubjectComparison.csv", sep=";")
View(RawDataRoundWithin)
myData <- RawDataRoundWithin

Group1Task1R1 <- as.numeric(unlist(myData[myData$PL_Round1 == 'G','CIT1_R1']))
Group1Task2R1 <- as.numeric(unlist(myData[myData$PL_Round1 == 'G','CIT2_R1']))
Group1Task3R1 <- as.numeric(unlist(myData[myData$PL_Round1 == 'G','CIT3_R1']))
Group1Task4R1 <- as.numeric(unlist(myData[myData$PL_Round1 == 'G','CIT4_R1']))
Group1Task5R1 <- as.numeric(unlist(myData[myData$PL_Round1 == 'G','CIT5_R1']))
Group1Task6R1 <- as.numeric(unlist(myData[myData$PL_Round1 == 'G','TEFT1_R1']))
Group1Task7R1 <- as.numeric(unlist(myData[myData$PL_Round1 == 'G','TEFT2_R1']))
Group1Task8R1 <- as.numeric(unlist(myData[myData$PL_Round1 == 'G','SEFT1_R1']))
Group1Task9R1 <- as.numeric(unlist(myData[myData$PL_Round1 == 'G','SEFT2_R1']))

Group2Task1R1 <- as.numeric(unlist(myData[myData$PL_Round1 == 'J','CIT1_R1']))
Group2Task2R1 <- as.numeric(unlist(myData[myData$PL_Round1 == 'J','CIT2_R1']))
Group2Task3R1 <- as.numeric(unlist(myData[myData$PL_Round1 == 'J','CIT3_R1']))
Group2Task4R1 <- as.numeric(unlist(myData[myData$PL_Round1 == 'J','CIT4_R1']))
Group2Task5R1 <- as.numeric(unlist(myData[myData$PL_Round1 == 'J','CIT5_R1']))
Group2Task6R1 <- as.numeric(unlist(myData[myData$PL_Round1 == 'J','TEFT1_R1']))
Group2Task7R1 <- as.numeric(unlist(myData[myData$PL_Round1 == 'J','TEFT2_R1']))
Group2Task8R1 <- as.numeric(unlist(myData[myData$PL_Round1 == 'J','SEFT1_R1']))
Group2Task9R1 <- as.numeric(unlist(myData[myData$PL_Round1 == 'J','SEFT2_R1']))

Group1Task1R2 <- as.numeric(unlist(myData[myData$PL_Round2 == 'J','CIT1_R2']))
Group1Task2R2 <- as.numeric(unlist(myData[myData$PL_Round2 == 'J','CIT2_R2']))
Group1Task3R2 <- as.numeric(unlist(myData[myData$PL_Round2 == 'J','CIT3_R2']))
Group1Task4R2 <- as.numeric(unlist(myData[myData$PL_Round2 == 'J','CIT4_R2']))
Group1Task5R2 <- as.numeric(unlist(myData[myData$PL_Round2 == 'J','CIT5_R2']))
Group1Task6R2 <- as.numeric(unlist(myData[myData$PL_Round2 == 'J','TEFT1_R2']))
Group1Task7R2 <- as.numeric(unlist(myData[myData$PL_Round2 == 'J','TEFT2_R2']))
Group1Task8R2 <- as.numeric(unlist(myData[myData$PL_Round2 == 'J','SEFT1_R2']))
Group1Task9R2 <- as.numeric(unlist(myData[myData$PL_Round2 == 'J','SEFT2_R2']))

Group2Task1R2 <- as.numeric(unlist(myData[myData$PL_Round2 == 'G','CIT1_R2']))
Group2Task2R2 <- as.numeric(unlist(myData[myData$PL_Round2 == 'G','CIT2_R2']))
Group2Task3R2 <- as.numeric(unlist(myData[myData$PL_Round2 == 'G','CIT3_R2']))
Group2Task4R2 <- as.numeric(unlist(myData[myData$PL_Round2 == 'G','CIT4_R2']))
Group2Task5R2 <- as.numeric(unlist(myData[myData$PL_Round2 == 'G','CIT5_R2']))
Group2Task6R2 <- as.numeric(unlist(myData[myData$PL_Round2 == 'G','TEFT1_R2']))
Group2Task7R2 <- as.numeric(unlist(myData[myData$PL_Round2 == 'G','TEFT2_R2']))
Group2Task8R2 <- as.numeric(unlist(myData[myData$PL_Round2 == 'G','SEFT1_R2']))
Group2Task9R2 <- as.numeric(unlist(myData[myData$PL_Round2 == 'G','SEFT2_R2']))

#shapiro-Wilk test for normality
shapiro.test(Group1Task1R1) #W = 0.87055, p-value = 0.02242
shapiro.test(Group1Task2R1) #W = 0.8538, p-value = 0.01226
shapiro.test(Group1Task3R1) #W = 0.83912, p-value = 0.00735
shapiro.test(Group1Task4R1) #W = 0.8937, p-value = 0.05335
shapiro.test(Group1Task5R1) #W = 0.85603, p-value = 0.01327
shapiro.test(Group1Task6R1) #W = 0.91605, p-value = 0.1266
shapiro.test(Group1Task7R1) #W = 0.91343, p-value = 0.1143
shapiro.test(Group1Task8R1) #W = 0.83169, p-value = 0.005709
shapiro.test(Group1Task9R1) #W = 0.71826, p-value = 0.0001876

shapiro.test(Group2Task1R1) #W = 0.8886, p-value = 0.05294
shapiro.test(Group2Task2R1) #W = 0.73824, p-value = 0.0004601
shapiro.test(Group2Task3R1) #W = 0.8596, p-value = 0.01892
shapiro.test(Group2Task4R1) #W = 0.70734, p-value = 0.0002035
shapiro.test(Group2Task5R1) #W = 0.80709, p-value = 0.003388
shapiro.test(Group2Task6R1) #W = 0.76416, p-value = 0.0009457
shapiro.test(Group2Task7R1) #W = 0.62501, p-value = 2.814e-05
shapiro.test(Group2Task8R1) #W = 0.97868, p-value = 0.9522
shapiro.test(Group2Task9R1) #W = 0.86936, p-value = 0.02659

shapiro.test(Group1Task1R2) #W = 0.94504, p-value = 0.3829
shapiro.test(Group1Task2R2) #W = 0.73543, p-value = 3e-04
shapiro.test(Group1Task3R2) #W = 0.86626, p-value = 0.01917
shapiro.test(Group1Task4R2) #W = 0.92618, p-value = 0.1878
shapiro.test(Group1Task5R2) #W = 0.9049, p-value = 0.08206
shapiro.test(Group1Task6R2) #W = 0.90389, p-value = 0.07892
shapiro.test(Group1Task7R2) #W = 0.74225, p-value = 0.000363
shapiro.test(Group1Task8R2) #W = 0.7457, p-value = 0.0004002
shapiro.test(Group1Task9R2) #W = 0.77786, p-value = 0.001024

shapiro.test(Group2Task1R2) #W = 0.79733, p-value = 0.00251
shapiro.test(Group2Task2R2) #W = 0.88778, p-value = 0.05138
shapiro.test(Group2Task3R2) #W = 0.92737, p-value = 0.2214
shapiro.test(Group2Task4R2) #W = 0.81815, p-value = 0.004794
shapiro.test(Group2Task5R2) #W = 0.81464, p-value = 0.004291
shapiro.test(Group2Task6R2) #W = 0.93315, p-value = 0.2733
shapiro.test(Group2Task7R2) #W = 0.80913, p-value = 0.003609
shapiro.test(Group2Task8R2) #W = 0.65515, p-value = 5.637e-05
shapiro.test(Group2Task9R2) #W = 0.72652, p-value = 0.0003359

wilcox.test(Group1Task1R1, Group1Task1R2,paired = TRUE) #V = 153, p-value = 1.526e-05
wilcox.test(Group1Task2R1, Group1Task2R2,paired = TRUE) #V = 148, p-value = 0.0001526
wilcox.test(Group1Task3R1, Group1Task3R2,paired = TRUE) #V = 147, p-value = 0.0002136
wilcox.test(Group1Task4R1, Group1Task4R2,paired = TRUE) #V = 149, p-value = 0.0001068
wilcox.test(Group1Task5R1, Group1Task5R2,paired = TRUE) #V = 153, p-value = 1.526e-05
wilcox.test(Group1Task6R1, Group1Task6R2,paired = TRUE) #V = 153, p-value = 1.526e-05
wilcox.test(Group1Task7R1, Group1Task7R2,paired = TRUE) #V = 153, p-value = 1.526e-05
wilcox.test(Group1Task8R1, Group1Task8R2,paired = TRUE) #V = 123, p-value = 0.02667
wilcox.test(Group1Task9R1, Group1Task9R2,paired = TRUE) #V = 123, p-value = 0.02667

# FDR-correction
# 0.02667 < 0.05*9/9 = 0.05 -> All remaining differences are significant


wilcox.test(Group2Task1R1, Group2Task1R2,paired = TRUE) #V = 70, p-value = 0.9399
wilcox.test(Group2Task2R1, Group2Task2R2,paired = TRUE) #V = 109, p-value = 0.03354
wilcox.test(Group2Task3R1, Group2Task3R2,paired = TRUE) #V = 44, p-value = 0.2312
wilcox.test(Group2Task4R1, Group2Task4R2,paired = TRUE) #V = 76, p-value = 0.7057
wilcox.test(Group2Task5R1, Group2Task5R2,paired = TRUE) #V = 11, p-value = 0.001678
wilcox.test(Group2Task6R1, Group2Task6R2,paired = TRUE) #V = 2, p-value = 9.155e-05
wilcox.test(Group2Task7R1, Group2Task7R2,paired = TRUE) #V = 1, p-value = 6.104e-05
wilcox.test(Group2Task8R1, Group2Task8R2,paired = TRUE) #V = 132, p-value = 0.0002136
wilcox.test(Group2Task9R1, Group2Task9R2,paired = TRUE) #V = 125, p-value = 0.001678

# FDR-correction
# 0.9399    > 0.05*9/9 = 0.05
# 0.7057    > 0.05*8/9 = 0.044
# 0.2312    > 0.05*7/9 = 0.038
# 0.03354   > 0.05*6/9 = 0.0333
# 0.001678  < 0.05*5/9 = 0.028  -> All remaining differences are significant
# 0.001678 
# 0.001678
# 0.0002136
# 6.104e-05
# 9.155e-05

#And now the aggregated analysis
Group1TaskCITR1 <- as.numeric(unlist(myData[myData$PL_Round1 == 'G','CIT_R1']))
Group1TaskTEFTR1 <- as.numeric(unlist(myData[myData$PL_Round1 == 'G','TEFT_R1']))
Group1TaskSEFTR1 <- as.numeric(unlist(myData[myData$PL_Round1 == 'G','SEFT_R1']))

Group2TaskCITR1 <- as.numeric(unlist(myData[myData$PL_Round1 == 'J','CIT_R1']))
Group2TaskTEFTR1 <- as.numeric(unlist(myData[myData$PL_Round1 == 'J','TEFT_R1']))
Group2TaskSEFTR1 <- as.numeric(unlist(myData[myData$PL_Round1 == 'J','SEFT_R1']))

Group1TaskCITR2 <- as.numeric(unlist(myData[myData$PL_Round2 == 'J','CIT_R2']))
Group1TaskTEFTR2 <- as.numeric(unlist(myData[myData$PL_Round2 == 'J','TEFT_R2']))
Group1TaskSEFTR2 <- as.numeric(unlist(myData[myData$PL_Round2 == 'J','SEFT_R2']))

Group2TaskCITR2 <- as.numeric(unlist(myData[myData$PL_Round2 == 'G','CIT_R2']))
Group2TaskTEFTR2 <- as.numeric(unlist(myData[myData$PL_Round2 == 'G','TEFT_R2']))
Group2TaskSEFTR2 <- as.numeric(unlist(myData[myData$PL_Round2 == 'G','SEFT_R2']))

shapiro.test(Group1TaskCITR1) #W = 0.89237, p-value = 0.0507
shapiro.test(Group1TaskTEFTR1) #W = 0.94746, p-value = 0.4176
shapiro.test(Group1TaskSEFTR1) #W = 0.85501, p-value = 0.0128

shapiro.test(Group2TaskCITR1) #W = 0.79993, p-value = 0.002718
shapiro.test(Group2TaskTEFTR1) #W = 0.78754, p-value = 0.001869
shapiro.test(Group2TaskSEFTR1) #W = 0.97558, p-value = 0.9189

shapiro.test(Group1TaskCITR2) #W = 0.88102, p-value = 0.03304
shapiro.test(Group1TaskTEFTR2) #W = 0.90569, p-value = 0.08461
shapiro.test(Group1TaskSEFTR2) #W = 0.75194, p-value = 0.0004781

shapiro.test(Group2TaskCITR2) #W = 0.98704, p-value = 0.996
shapiro.test(Group2TaskTEFTR2) #W = 0.8831, p-value = 0.04338
shapiro.test(Group2TaskSEFTR2) #W = 0.66672, p-value = 7.423e-05

wilcox.test(Group1TaskCITR1, Group1TaskCITR2,paired = TRUE) #V = 153, p-value = 1.526e-05
wilcox.test(Group1TaskTEFTR1, Group1TaskTEFTR2,paired = TRUE) #V = 153, p-value = 1.526e-05
wilcox.test(Group1TaskSEFTR1, Group1TaskSEFTR2,paired = TRUE) #V = 134, p-value = 0.004639
wilcox.test(Group2TaskCITR1, Group2TaskCITR2,paired = TRUE) #V = 57, p-value = 0.5966
wilcox.test(Group2TaskTEFTR1, Group2TaskTEFTR2,paired = TRUE) #V = 0, p-value = 3.052e-05
wilcox.test(Group2TaskSEFTR1, Group2TaskSEFTR2,paired = TRUE) #V = 135, p-value = 6.104e-05

# FDR-correction
# 0.5966    > 0.05*6/6 = 0.05
# 0.004639    > 0.05*5/6 = 0.04 -> All remaining differences are significant

