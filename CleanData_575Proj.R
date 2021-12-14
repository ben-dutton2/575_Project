## Script for cleaning the data for resistivity and purity measurements 

library(tidyr)
library(dplyr)

##Purity Cleaning 

PurityData <- read.csv("GDMS_R.csv", sep=",",header=TRUE)

outputPure <- PurityData %>%
  select(ï..Element, UU.Powder ,Zn.CZ,Zn.VGF)    #Select the precursor and dopant in this line

write.csv(outputPure, file = "C:\\ProgramData\\Zn_Purity.csv", row.names=FALSE) #select correct filename and path here

##Resistivity Cleaning

ResData <- read.csv("ElectronicMeasurementSummary_100121.csv", sep=",",header=TRUE)

outputRes <- ResData %>%
  select(Sample.Name,Resistivity..Ohm.cm.,Class) %>%
  filter(Class == "Cu")                                #select the desired dopant here

write.csv(outputRes, file = "C:\\ProgramData\\Cu_Resistivity.csv", row.names=FALSE) #select correct filename and path here


