setwd("/Users/fabiolima/Samples2/")
library(hyperSpec)
library(RColorBrewer)
library(plotrix)
library(gridExtra)
library(shape)
library(knitr)

file<- read.table("merge.csv", header = TRUE, dec = ".", sep = ",")
#d<- data.frame(file)
sam<- new ("hyperSpec", wavelength = file [,1], spc = t (file [, -1]), 
            data = data.frame (sample = colnames (file [, -1])),
            label = list(.wavelength = "Wavenumber /cm-1",
                                    spc = "I / a.u."))

plotspc(sam)