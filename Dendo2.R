setwd("/Users/fabiolima/Samples/")
r<- read.csv("matrix.csv", header = TRUE, sep=",", row.names = 1)
df<- data.frame(r)
####-Library
#library(dendextend)
library(colorspace)
library(cluster)
library(ape)
library(ggplot2)
library(ggdendro)
library(amap)
df.log<- log10(df[,2:3551])
#### Dendorgram 
d <- dist(df.log) # method="man" # is a bit better
hc<- hclust(d, method = "complete")
ggdendrogram(hc, rotate = TRUE, size = 7, theme_dendro = FALSE, color = "tomato") +
  xlab("Samples") +  ylab("Height") + theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=14), 
                                            axis.text.x = element_text(face="bold", color="#993333", size=10,angle=0),
                                            axis.text.y = element_text(face="bold", color="#993333", size=10, angle=0))
####################
#----- PCA Plot
################
##-----:)))))
s<- as.data.frame(df.log, nrow.names =1)
s.names<- row.names(df.log)
# apply PCA - scale. = TRUE is highly 
# advisable, but default is FALSE. 
s.pca <- prcomp(s, center = TRUE, scale. = TRUE) 
#print(s.pca, 3)
#summary(s.pca)
####Plot
#predict(s.pca, newdata=tail(s, 2))
library(ggbiplot)
############
s.out <- s.pca
s.out$rotation <- -s.out$rotation
s.out$x <- -s.out$x
#########
g <- ggbiplot(s.out, obs.scale = 0, var.scale = 1, labels = row.names(df.log), ellipse = TRUE, circle = TRUE)
g <- g + scale_color_discrete(name = '')
g <- g + theme(legend.direction = 'horizontal', legend.position = 'top')
print(g)
