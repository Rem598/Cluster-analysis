install.packages("factoextra")
install.packages("NbClust")
install.packages("ggplot2")
library(ggplot2)

#Load the data
library(readr)
framingham<-read.csv("framingham.csv")

#remove missing values
framingham_1<-na.omit(framingham)

# identify colums with zero variance
# Calculate variances of each column
column_variances <- apply(framingham_1, 2, var)
zero_variance_columns <- which(column_variances == 0)

#remove columns with zero variance
install.packages("caret")
library(caret)
framingham_2<-framingham_1[, -zero_variance_columns]

#Standardize the data
DF<-scale(framingham_1)

#Compute distance matrix
DIST<-dist(DF,method = "euclidean")

#Create a hierarchical tree
library(stats)
H_TREE<-hclust(d = DIST, method = "ward.D")

#Dendogram
library(factoextra)
fviz_dend(H_TREE,cex = 0.5)

#optimal number of clusters
library(NbClust)
fviz_nbclust(DF1, FUNcluster = hcut, method = "wss")

nb.fit<-NbClust(DF1[,1:2], distance = "euclidean", min.nc=2, max.nc=10, 
                method = "average", index = "all")


#Cut tree into groups
Clusters<-cutree(H_TREE , k=2)


##visualize clusters
fviz_cluster(list(H_TREE,data = DF, cluster = Clusters))
color = as.factor(Clusters)
ellipse.type = 'euclidean'
repel = TRUE 
show.clust.cent = FALSE
ggtheme = theme_minimal()  



# Cut in 2 groups and color by groups
fviz_dend(H_TREE, k = 2, # Cut in two groups
          cex = 0.5, # label size
          k_colors = c("navy", "green"),
          color_labels_by_k = TRUE, # color labels by groups
          rect = TRUE # Add rectangle around groups
)






