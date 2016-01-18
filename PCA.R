setwd("/Users/fabiolima/Samples/")
r<- read.csv("matrix.csv", header = TRUE, sep=",", row.names = 1)
#df<- data.frame(r)
df<- log10(r)
#####
##s<- data.matrix(df)
s<- as.data.frame(df, nrow.names =1)
s.pca <- prcomp(s, center = TRUE, scale. = TRUE) 
###
sd <- s.pca$sdev
loadings <- s.pca$rotation
rownames(loadings) <- colnames(s)
scores <- s.pca$x

###################################
###  Plot Bar Plot         ########
###################################
library(ggplot2)
var <- sd^2
var.percent <- var/sum(var) * 100
dev.new()
#barplot(var.percent, xlab="PC", ylab="Percent Variance", names.arg=1:length(var.percent), las=1, ylim=c(0,max(var.percent)), col="gray")
#abline(h=1/ncol(df.log)*100, col="red")

#head(s.pca$rotation,4)

####
scores=as.data.frame(s.pca$x)
###
p<- ggplot(data = scores, obs.scale = .8, var.scale = 1, show.names=TRUE, aes(x = PC1, y = PC2, label = rownames(scores)))
p<- p + geom_hline(yintercept = 0, colour = "gray65")
p<- p + geom_vline(xintercept = 0, colour = "gray65")
p<- p + geom_text(colour = "black", alpha = 0.8, size = 4)
p<- p + ggtitle("PCA plot Samples - Cooffe")
p<- p + theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=16))
p<- p + theme(axis.text.x = element_text(face="bold", color="#993333", size=14,angle=0))
p<- p + theme(axis.text.y = element_text(face="bold", color="#993333", size=14, angle=0))
p<- p + xlab("PC1")
p<- p + ylab("PC2")
print(p)
ggsave("/Users/fabiolima/R/PCA.png", plot = last_plot(), device = "png", scale =1,  width = 200, height = 640, dpi=300, limitsize=FALSE)

