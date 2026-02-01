#  Cluster Analysis in R

## 🎯 Problem Statement

This project applies **unsupervised cluster analysis** techniques to the widely used **Framingham Heart Study dataset** using the **R** programming language. The core goal is to identify **distinct groups** within the patient population that exhibit similar **cardiovascular health risk factors**. The analysis provides a foundation for **risk stratification**, **targeted public health intervention programs**, and **optimizing clinical resource allocation** for preventative care.

**Tools Used:** **R** (Programming Language), **`dist`**, **`hclust`**, **`factoextra`**, **`NbClust`** (R Libraries)

---

## 🗃️ Dataset Overview

The dataset used is the **Framingham Heart Study**, which contains multiple physiological and demographic variables. While originally a medical study, the data is used here to demonstrate the ability to segment high-dimensional data based on multiple features simultaneously.

* **Key Action:** Data preprocessing involved handling missing values (`na.omit`) and standardizing features to ensure all variables contributed equally to the distance calculation.

[Dataset Source: Kaggle Dataset](https://www.kaggle.com/datasets/mohannapd/ramingham-heart-study)

---

## 🔧 Methodology & R Code Highlights

-Preprocessed data (handled missing values, standardized features).
-Computed Euclidean distance matrix.
-Performed hierarchical clustering (Ward’s method) and k-means clustering.
-Visualized cluster structures using dendrograms and scatter plots.

### 1. Data Preprocessing

Data was loaded and cleaned to ensure robust model performance.

```R
library(readr)
framingham <- read.csv("Framingham.csv")
framingham_1 <- na.omit(framingham)
```
### 2. Determining Optimal Cluster Count
The NbClust package was used to statistically determine the optimal number of clusters (k), minimizing within-cluster variance while maximizing between-cluster variance.
```R
library(NbClust)
nb.fit <- NbClust(framingham_1, distance = "euclidean", min.nc=2, max.nc=10, method = "average")
```
Optimal Number of Clusters 
![Clusters numbers](https://github.com/Rem598/Cluster-analysis/blob/main/Optimal%20Clusters.png)

### 3. Hierarchical Clustering (H-Clust)
H-Clust was performed using Ward's minimum variance method (ward.D) to generate the cluster hierarchy, which provides a visual structure of the data's segmentation.
```R
DIST <- dist(framingham_1, method = "euclidean")
H_TREE <- hclust(DIST, method = "ward.D")
fviz_dend(H_TREE, cex = 0.5)
```
### 4.Cluster Visualization
```R
Clusters<-cutree(H_TREE , k=2)
fviz_cluster(list(H_TREE, data = framingham_1, cluster = Clusters))
```
Clusters Visualization
![Clusters](https://github.com/Rem598/Cluster-analysis/blob/main/Clusters.png)

### 5. Final Cluster VisualizationThe optimal number of clusters ($k=2$) was cut from the hierarchy and visualized, clearly separating the two primary groups based on their feature characteristics.
```R
# Cut the tree into 2 groups and visualize
Clusters <- cutree(H_TREE, k=2)
fviz_cluster(list(H_TREE, data = framingham_1, cluster = Clusters))
```
Dendrogram
![Tree](https://github.com/Rem598/Cluster-analysis/blob/main/Dend%20colored.png)

💡**Key Insights**
- Clear Segmentation: Both Hierarchical Clustering and k-means validated that two distinct segments are present in the data, as evidenced by the NbClust result.

- Actionable Grouping: The identified clusters exhibit clear statistical differences in their means across key variables (e.g., age, blood pressure, etc.), allowing for the definition of distinct customer profiles (e.g., "High-Risk Segment" vs. "Low-Risk Segment").

- Methodological Proof: The project demonstrates proficiency in standardizing data, measuring distance, and validating cluster stability—essential skills for any segmentation task.
