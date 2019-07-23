#read data
DataR <- read.csv("C:/Users/Janet/Desktop/fMRI-ML/ReanalyzeStudy/FLEXJAVA_Language Support for Safe and Modular Approximate Programming/data.csv", sep=";")

#first the response times
#define data on which to test
Group1T1 <- as.numeric(unlist(DataR[DataR$Group == 'FlexJava','sor']))
Group1T2 <- as.numeric(unlist(DataR[DataR$Group == 'FlexJava','smm']))
Group1T3 <- as.numeric(unlist(DataR[DataR$Group == 'FlexJava','fft']))
mean(Group1T1) #2.8
mean(Group1T2) #1.95
mean(Group1T3) #3

Group2T1 <- as.numeric(unlist(DataR[DataR$Group == 'EnerJ','sor']))
Group2T2 <- as.numeric(unlist(DataR[DataR$Group == 'EnerJ','smm']))
Group2T3 <- as.numeric(unlist(DataR[DataR$Group == 'EnerJ','fft']))
mean(Group2T1) #14.9
mean(Group2T2) #18.44
mean(Group2T3) #19.94

#shapiro-Wilk test for normality
shapiro.test(Group1T1)
#W = 0.866, p-value = 0.089

shapiro.test(Group1T2)
#W = 0.731, p-value = 0.002

shapiro.test(Group1T3)
#W = 0.925, p-value = 0.405

shapiro.test(Group2T1)
#W = 0.859, p-value = 0.075

shapiro.test(Group2T2)
#W = 0.947, p-value = 0.635

shapiro.test(Group2T3)
#W = 0.763, p-value = 0.005

#run the significance tests
t.test(Group1T1, Group2T1,paired = TRUE)
wilcox.test(Group1T2, Group2T2,paired = TRUE)
wilcox.test(Group1T3, Group2T3,paired = TRUE)

#result
#sor: t = -9.883, df = 9, p-value = 3.945e-06
#smm: W = 0, p-value = 0.002
#fft: W = 0, p-value = 0.006

Group1M <- as.numeric(unlist(DataR[DataR$Group == 'FlexJava','Mittelwert'])) #Mittelwert == mean
Group1S <- as.numeric(unlist(DataR[DataR$Group == 'FlexJava','Summe']))      #Summe == sum
Group2M <- as.numeric(unlist(DataR[DataR$Group == 'EnerJ','Mittelwert']))
Group2S <- as.numeric(unlist(DataR[DataR$Group == 'EnerJ','Summe']))

shapiro.test(Group1M)
#W = 0.893, p-value = 0.185
shapiro.test(Group1S)
#W = 0.893, p-value = 0.185

shapiro.test(Group2M)
#W = 0.948, p-value = 0.649
shapiro.test(Group2S)
#W = 0.948, p-value = 0.649

t.test(Group1M, Group2M,paired = TRUE) #t =  -8.908, df = 9, p < 9.279e-06
t.test(Group1S, Group2S,paired = TRUE) #t =  -8.908, df = 9, p < 9.279e-06

