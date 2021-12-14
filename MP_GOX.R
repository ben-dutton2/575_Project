## matrix Profile applied to gallium oxide crystal growth

install.packages("tsmp")
library(dplyr)
library(tsmp)
library(ggplot2)
exampleData = read.csv("SGO_GrowthData.csv", sep=",",header=TRUE)
mass2 <- exampleData %>%                 
  select(mass..g.,input.Lin.Velocity.mm.hr) %>%
  filter(input.Lin.Velocity.mm.hr>1, input.Lin.Velocity.mm.hr<13, mass..g.<200) %>%
  select(mass..g.)

ggplot(data=mass2, aes(x = as.numeric(row.names(mass2)), y=mass..g.))+geom_line()+labs( x="Index", y="Mass (g)")

matrix <-
  tsmp(mass2, window_size = 10)
  visualize(matrix)
  
  find_motif(n_motifs = 3) %>%
  plot()

MP <- tsmp(mass2, window_size = 30)
dis<-discords(MP)
visualize(dis)

analyze(as.numeric(unlist(mass2)))

## Normal Growth MP

power1 <- exampleData %>%                 
  select(Apparent.Power) %>%
  filter(Apparent.Power>1000)
MPpower <- tsmp(power1, window_size = 10)
visualize(MPpower)
ggplot(data=power1, aes(x = as.numeric(row.names(power1)), y=Apparent.Power))+geom_line()+labs( x="Index", y="Power (kVA)")
discords(MPpower)%>%
visualize()
 
temp1 <- exampleData %>%                 
  select(Sapphire.Pyrometer) %>%
  filter(Sapphire.Pyrometer>1000)
MPtemp <- tsmp(temp1, window_size = 10)
visualize(MPtemp)
ggplot(data=temp1, aes(x = as.numeric(row.names(temp1)), y=Sapphire.Pyrometer))+geom_line()+labs( x="Index", y="Temperature (C)")


## Leak detection

simProfile = read.csv("Similarity.csv", sep=",",header=TRUE)
success <-
  simProfile %>%
  select(GaO.15G3,GaO.14G2)
  
Spiral <-
  simProfile %>%
  select(GaO.15G2,GaO.13G1)
Leak <-
  simProfile %>%
  select(GaO.14G3,GaO.12G1)
SuccLeak<-
  simProfile %>%
  select(GaO.15G3,GaO.14G3)
SuccSpiral<-
  simProfile %>%
  select(GaO.15G3,GaO.13G1)

MPspiral <- tsmp(Spiral$GaO.15G2, window_size = 20)
disSpiral<-discords(MPspiral)
visualize(MPspiral)
ggplot(data=Spiral$GaO.15G2, aes(x = as.numeric(row.names(mass2)), y=GaO.15))+geom_line()+labs( x="Index", y="Mass (g)")

