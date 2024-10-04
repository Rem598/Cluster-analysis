# Cluster-analysis in R using Framingham heart study data


install.packages("factoextra")
install.packages("NbClust")
install.packages("ggplot2")
library(ggplot2)

#Load the data
library(readr)
Heartstudy_2<-read.csv("Heartstudy-2.csv")

#remove missing values
Heartstudy_2<-na.omit(Heartstudy_2)

# identify colums with zero variance
# Calculate variances of each column
column_variances <- apply(Heartstudy_2, 2, var)
zero_variance_columns <- which(column_variances == 0)

#remove columns with zero variance
install.packages("caret")
library(caret)
Heartstudy_2.0<-Heartstudy_2[, -zero_variance_columns]

#Standardize the data
DF1<-scale(Heartstudy_2.0)

#Compute distance matrix
DIST<-dist(DF1,method = "euclidean")


#Create a hierarchical tree
library(stats)
H_TREE1<-hclust(d = DIST, method = "ward.D")

#Dendogram
library(factoextra)
fviz_dend(H_TREE1,cex = 0.5)

#optimal number of clusters
library(NbClust)
fviz_nbclust(DF1, FUNcluster = hcut, method = "wss")

nb.fit<-NbClust(DF1[,1:2], distance = "euclidean", min.nc=2, max.nc=10, 
                method = "average", index = "all")


#Cut tree into groups
Clusters12<-cutree(H_TREE1 , k=2)


##visualize clusters
fviz_cluster(list(H_TREE1,data = DF1, cluster = Clusters12))
              color = as.factor(Clusters12)
              ellipse.type = 'euclidean'
              repel = TRUE 
              show.clust.cent = FALSE
              ggtheme = theme_minimal()  



# Cut in 2 groups and color by groups
fviz_dend(H_TREE1, k = 2, # Cut in two groups
          cex = 0.5, # label size
          k_colors = c("blue", "red"),
          color_labels_by_k = TRUE, # color labels by groups
          rect = TRUE # Add rectangle around groups
)



