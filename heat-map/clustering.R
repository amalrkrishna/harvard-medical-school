#R script for generating the hirearchical clustered data-set

library(gplots) 
setwd('/Users/amal/Documents/Harvard/heat-map')

data <- read.csv(file="test_gene_cell_dataset.csv", header=TRUE, sep=",")
col<-colnames(data)[-1]
row<-as.character(data[,"X"])
data<-data[,col]
y <- matrix(data.matrix(data), 5000, 10, dimnames=list(row, col)) 

result<-heatmap.2(y)
data_final<-y[rev(result$rowInd), result$colInd]
write.csv(data_final,file="clustered_data.csv")