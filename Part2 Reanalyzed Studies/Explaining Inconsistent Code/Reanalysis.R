myData <- read.csv("C:/Users/Janet/Desktop/fMRI-ML/ReanalyzeStudy/Explaining Inconsistent Code/data.csv", sep=";")
View(myData)

withoutEIA <- as.numeric(unlist(myData[myData$Group == 'WithoutEIA','Time']))
withEIA <- as.numeric(unlist(myData[myData$Group == 'WithEIA','Time']))

#shapiro-Wilk test for normality
shapiro.test(withoutEIA) #W = 0.9427, p-value = 0.5338
shapiro.test(withEIA) #W = 0.83097, p-value = 0.02154

wilcox.test(withoutEIA, withEIA,paired = TRUE) #V = 75, p-value = 0.002441