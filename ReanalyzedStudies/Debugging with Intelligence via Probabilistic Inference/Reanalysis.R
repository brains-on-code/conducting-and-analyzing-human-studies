#read data
DataR <- read.csv("C:/Users/Janet/Desktop/fMRI-ML/ReanalyzeStudy/Debugging with Intelligence via Probabilistic Inference/data.csv", sep=";")
View(DataR)

#first the response times
#define data on which to test
Group1Time <- as.numeric(unlist(DataR[DataR$Group == '1','Time']))
Group2Time <- as.numeric(unlist(DataR[DataR$Group == '2','Time']))
mean(Group1Time) #77.9375
mean(Group2Time) #338.9375

#shapiro-Wilk test for normality
shapiro.test(Group1Time) #W = 0.9736, p-value = 0.604
shapiro.test(Group2Time) #W = 0.93926, p-value = 0.07135

#t test on aggregated response times
t.test(Group1Time, Group2Time,paired = TRUE) #t = 4.489, df = 31, p-value = 9.235e-05

Group1TimeT1 <- as.numeric(unlist(DataR[DataR$Task == 'lcsubstr'&DataR$Group == '1','Time']))
Group1TimeT2 <- as.numeric(unlist(DataR[DataR$Task == 'quadratic'&DataR$Group == '1','Time']))
Group1TimeT3 <- as.numeric(unlist(DataR[DataR$Task == 'fibonaci'&DataR$Group == '1','Time']))
Group1TimeT4 <- as.numeric(unlist(DataR[DataR$Task == 'mergesort'&DataR$Group == '1','Time']))

Group2TimeT1 <- as.numeric(unlist(DataR[DataR$Task == 'lcsubstr'&DataR$Group == '2','Time']))
Group2TimeT2 <- as.numeric(unlist(DataR[DataR$Task == 'quadratic'&DataR$Group == '2','Time']))
Group2TimeT3 <- as.numeric(unlist(DataR[DataR$Task == 'fibonaci'&DataR$Group == '2','Time']))
Group2TimeT4 <- as.numeric(unlist(DataR[DataR$Task == 'mergesort'&DataR$Group == '2','Time']))

#shapiro-Wilk test for normality
shapiro.test(Group1TimeT1) #W = 0.95088, p-value = 0.7201
shapiro.test(Group1TimeT2) #W = 0.93068, p-value = 0.5223
shapiro.test(Group1TimeT3) #W = 0.90248, p-value = 0.3041
shapiro.test(Group1TimeT4) #W = 0.92466, p-value = 0.4688

shapiro.test(Group2TimeT1) #W = 0.92474, p-value = 0.4694
shapiro.test(Group2TimeT2) #W = 0.92387, p-value = 0.462
shapiro.test(Group2TimeT3) #W = 0.95378, p-value = 0.7492
shapiro.test(Group2TimeT4) #W = 0.96132, p-value = 0.8226

#rerun correct tests
t.test(Group1TimeT1, Group2TimeT1,paired = TRUE,alternative = c("greater")) #t = 2.5761, df = 7, p-value = 0.01834
t.test(Group1TimeT2, Group2TimeT2,paired = TRUE,alternative = c("greater")) #t = 2.1764, df = 7, p-value = 0.03299
t.test(Group1TimeT3, Group2TimeT3,paired = TRUE,alternative = c("greater")) #t = 1.7598, df = 7, p-value = 0.06092
t.test(Group1TimeT4, Group2TimeT4,paired = TRUE,alternative = c("greater")) #t = 2.1704, df = 7, p-value = 0.03329

#rerun wilcoxon tests
wilcox.test(Group1TimeT1,Group2TimeT1,paired=TRUE,alternative = c("greater")) #V = 34, p-value = 0.01172
wilcox.test(Group1TimeT2,Group2TimeT2,paired=TRUE,alternative = c("greater")) #V = 31, p-value = 0.03906
wilcox.test(Group1TimeT3,Group2TimeT3,paired=TRUE,alternative = c("greater")) #V = 28, p-value = 0.09766
wilcox.test(Group1TimeT4,Group2TimeT4,paired=TRUE,alternative = c("greater")) #V = 32, p-value = 0.02734