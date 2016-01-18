
#get a list of files
# merge columns that are in a list into one data.frame Melhor merge
library(plyr)
setwd("/Users/fabiolima/Samples")
filenames <- list.files(path="/Users/fabiolima/Samples", full.names=TRUE)
import.list <- llply(filenames, read.csv)
m <- Reduce(function(x, y) merge(x, y, all.x=TRUE, all.y=TRUE),import.list,accumulate=FALSE)
#
#str(m)
#Save merge dates
write.table(m, "merge.csv",row.names=TRUE, sep=",")
##r<-read.csv("test.csv")
#####################Method 2#################
######################


