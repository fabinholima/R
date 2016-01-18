
setwd("/Users/fabiolima/Samples2")
s<- read.table("merge.csv",sep=",",head=T)
##Loading packages
library(latex2exp) #symbols latex in plots graphics
library(ggplot2) #Library ggplot
library(reshape2)
s<- melt(s,id.vars = "Onda")
ggplot(s, aes(Onda,value, col=variable)) +  geom_line() + scale_x_reverse() +
  xlab(TeX('Wavenumber / $cm^{-1}$')) + ylab('intensity')+ theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=14), 
                                                                 axis.text.x = element_text(face="bold", color="#993333", size=10,angle=0),
                                                                 axis.text.y = element_text(face="bold", color="#993333", size=10, angle=0))
ggsave("plot.png",  width = 9, height = 10, dpi=300)
###################

