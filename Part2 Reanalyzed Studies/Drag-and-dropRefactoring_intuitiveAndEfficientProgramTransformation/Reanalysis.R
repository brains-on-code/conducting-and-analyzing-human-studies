#read data
DataR <- read.csv("C:/Users/Janet/Desktop/fMRI-ML/ReanalyzeStudy/Drag-and-dropRefactoring_intuitiveAndEfficientProgramTransformation/data.csv", sep=";")
view(DataR)

#get the response times per task and group
#9 Tasks, because Three-step refactoring consists of three subtasks (denoted here as Task 7),
#which are summarized for DNDRefactoring
Group1Task1 <- as.numeric(unlist(DataR[DataR$Group == 'Eclipse','Task1']))
Group1Task2 <- as.numeric(unlist(DataR[DataR$Group == 'Eclipse','Task2']))
Group1Task3 <- as.numeric(unlist(DataR[DataR$Group == 'Eclipse','Task3']))
Group1Task4 <- as.numeric(unlist(DataR[DataR$Group == 'Eclipse','Task4']))
Group1Task5 <- as.numeric(unlist(DataR[DataR$Group == 'Eclipse','Task5']))
Group1Task7 <- as.numeric(unlist(DataR[DataR$Group == 'Eclipse','Task7']))
Group1Task9 <- as.numeric(unlist(DataR[DataR$Group == 'Eclipse','Task9']))

Group2Task1 <- as.numeric(unlist(DataR[DataR$Group == 'DNDR','Task1']))
Group2Task2 <- as.numeric(unlist(DataR[DataR$Group == 'DNDR','Task2']))
Group2Task3 <- as.numeric(unlist(DataR[DataR$Group == 'DNDR','Task3']))
Group2Task4 <- as.numeric(unlist(DataR[DataR$Group == 'DNDR','Task4']))
Group2Task5 <- as.numeric(unlist(DataR[DataR$Group == 'DNDR','Task5']))
Group2Task7 <- as.numeric(unlist(DataR[DataR$Group == 'DNDR','Task7']))
Group2Task9 <- as.numeric(unlist(DataR[DataR$Group == 'DNDR','Task9']))

Group1AllTasks <- as.numeric(unlist(DataR[DataR$Group == 'Eclipse','TOTAL']))
Group2AllTasks <- as.numeric(unlist(DataR[DataR$Group == 'DNDR','TOTAL']))

#compute the mean per task and group
mean(Group1Task1) # 33.63333
mean(Group1Task2) # 69.28889
mean(Group1Task3) #  9.4 
mean(Group1Task4) # 12.12222 
mean(Group1Task5) #  5.566667
mean(Group1Task7) # 71.03333 
mean(Group1Task9) # 45.05556 # <- different from the original study

mean(Group2Task1) # 29.91111 
mean(Group2Task2) #  7.4 
mean(Group2Task3) #  3.966667
mean(Group2Task4) #  4.344444
mean(Group2Task5) #  3.622222 
mean(Group2Task7) # 19.15556
# na.rm=TRUE, since there is one data point missing (P1, Task 9)
mean(Group2Task9,na.rm=TRUE) # 14.875 

#shapiro-Wilk test for normality
shapiro.test(Group1Task1) #W = 0.78531, p-value = 0.01386
shapiro.test(Group1Task2) #W = 0.96865, p-value = 0.883
shapiro.test(Group1Task3) #W = 0.85758, p-value = 0.09023
shapiro.test(Group1Task4) #W = 0.82672, p-value = 0.04102
shapiro.test(Group1Task5) #W = 0.71056, p-value = 0.001885
shapiro.test(Group1Task7) #W = 0.92815, p-value = 0.4639 <- normal distribution -> t test
shapiro.test(Group1Task9) #W = 0.55704, p-value = 2.995e-05

shapiro.test(Group2Task1) #W = 0.85003, p-value = 0.07458
shapiro.test(Group2Task2) #W = 0.74614, p-value = 0.00489
shapiro.test(Group2Task3) #W = 0.68845, p-value = 0.00104
shapiro.test(Group2Task4) #W = 0.6073, p-value = 0.0001165
shapiro.test(Group2Task5) #W = 0.6607, p-value = 0.0004926
shapiro.test(Group2Task7) #W = 0.89202, p-value = 0.2093 <- normal distribution -> t test
shapiro.test(Group2Task9) #W = 0.94931, p-value = 0.7043

shapiro.test(Group1AllTasks) #W = 0.98526, p-value = 0.9858 <- normal distribution -> t test
shapiro.test(Group2AllTasks) #W = 0.96679, p-value = 0.8659 <- normal distribution -> t test

wilcox.test(Group1Task1, Group2Task1,paired = TRUE) #V = 18, p-value = 0.6523
wilcox.test(Group1Task2, Group2Task2,paired = TRUE) #V = 45, p-value = 0.003906
wilcox.test(Group1Task3, Group2Task3,paired = TRUE) #V = 45, p-value = 0.003906
wilcox.test(Group1Task4, Group2Task4,paired = TRUE) #V = 40, p-value = 0.03906
wilcox.test(Group1Task5, Group2Task5,paired = TRUE) #V = 41, p-value = 0.02734
wilcox.test(Group1Task9, Group2Task9,paired = TRUE) #V = 36, p-value = 0.007813

t.test(Group1Task7, Group2Task7,paired = TRUE) #t = 4.8144, df = 8, p-value = 0.001331
t.test(Group1AllTasks, Group2AllTasks,paired = TRUE) #t = 8.1747, df = 8, p-value = 3.737e-05

#FDR
#FDR: Sort p values by size, iteratively adjust p level
#0.6523   -> 8/8*0.05 = 0.05
#0.03906  -> 7/8*0.05 = 0.044 (p value is smaller than adjusted p level, so all following p values are significant)
#0.02734  -> 6/8*0.05 = 0.038
#0.007813 -> 5/8*0.05 = ...
#0.003906 -> 4/8*0.05 = 
#0.003906 -> 3/8*0.05 = 
#0.001331 -> 2/8*0.05 = 
#0.000004 -> 1/8*0.05 = 
