setwd("/Users/fabiolima/Samples2/")
r<- read.csv("Matrix3.csv", row.names = 1)
df<- as.matrix(r)
library(sparcl)
library(cluster)
library(ape)
library(ggplot2)
library(ggdendro)
library(amap)
###Data for dendogram
df.log <- log10(df[,1:29])
hc = hclust(dist(df.log))
#hc <- hcluster(df,method = "euc",link = "ward", nbproc= 1, doubleprecision = TRUE)
#Function plot dendogram
ggdendrogram(hc, rotate = FALSE, size = 7, theme_dendro = FALSE, color = "tomato") +
xlab("Samples") +  ylab("Height") + theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=14), 
                         axis.text.x = element_text(face="bold", color="#993333", size=10,angle=0),
                         axis.text.y = element_text(face="bold", color="#993333", size=10, angle=0))
####Finished Dendogram
                                                   