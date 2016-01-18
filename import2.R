setwd("/Users/fabiolima/SamplesAbs/")
#library(hyperSpec)
#------
library(RColorBrewer)
library(plotrix)
library(gridExtra)
library(shape)
library(knitr)
library(R.utils)
library(base) # package for data.frame
library(ChemoSpec)
files2SpectraObject(gr.crit = c("IDA", "IDB"), gr.cols = c("red", "blue"),
                    freq.unit = "wavenumber / cm-1", int.unit = "Intensity", 
                    descrip = "coofee", 
                    format = "csv", out.file = "samples", debug = TRUE)
df<- loadObject("samples.RData")
#### Plot of spectra, looking for areas of interest, and noise:
#plotSpectra(df, main='Teste', which = 1:29, offset = 0.00,  xlim = c(4000, 400), lab.pos = 2200)
#Plot range Sprectrum
plotSpectra(df, main='Teste', which = c(1, 3, 5, 10, 17, 20,24), offset = 0.00,  xlim = c(4000, 400), lab.pos = 2200)
# Norm Spectra
#norm<- normSpectra(df)
##---Plot Normalize Spectrum
#plotSpectra(norm, main='Teste', which = 1:29, offset = 0.0,  xlim = c(4000, 400), lab.pos = 2200)
df2 <- removeFreq(df, rem.freq = df$freq > 1900 & df$freq < 2500)
sumSpectra(df2)
check4Gaps(df2$freq, df2$data[1,], plot = TRUE,xlim = c(4000, 400))
#Plot Dendogram
HCA <- hcaSpectra(df2, c.method = "complete", d.method = "euclidean", use.sym = FALSE, main = "S. repens IR Spectra")

#Plot PCA scores
class <- c_pcaSpectra(df2, choice = "noscale")
plotScores(df2, main = "S. repens IR Spectra", class, pcs = c(1,2), ellipse = "rob", tol = 0.01)
robust <- r_pcaSpectra(df2, choice = "noscale")
plotScores(df2, main = "S. repens IR Spectra", robust, pcs = c(1,2), ellipse = "rob", tol = 0.01)
####---------
diagnostics <- pcaDiag(df2, class, pcs = 2, plot = "OD")
diagnostics <- pcaDiag(df2, class, pcs = 2, plot = "SD")
plotScree(class, main = "S. repens IR Spectra")
