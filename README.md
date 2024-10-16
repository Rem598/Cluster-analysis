
# Cluster Analysis on Framingham Heart Study Data

## Project Overview
This project applies **cluster analysis** techniques to the **Framingham Heart Study dataset** using R. The goal is to identify patterns or groupings within the data that can offer insights into cardiovascular health risks based on different features such as age, cholesterol levels, and blood pressure.

## Dataset
The **Framingham Heart Study** dataset includes health data related to cardiovascular conditions collected over several years. Key features include:
- Age
- Sex
- Blood Pressure
- Cholesterol Levels
- Smoking Status
- Diabetes Indicator
- BMI (Body Mass Index)
- Heart Disease Indicator

The dataset is widely used in medical research to study risk factors associated with cardiovascular diseases.

## Project Structure
- **Data Cleaning**: Preprocessing the dataset to handle missing values, outliers, and ensure data readiness for clustering.
- **Clustering Algorithms**: Applying clustering techniques such as:
  - **K-Means Clustering**
  - **Hierarchical Clustering**
- **Model Evaluation**: Evaluating clusters based on silhouette scores, inertia, and visual inspections.

## Requirements
To run the project, you'll need the following R packages:

```r
install.packages(c("ggplot2", "dplyr", "cluster", "factoextra", "tidyverse"))
```

## Files
- `framingham_data.csv`: The dataset used for analysis.


## How to Run
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/framingham-cluster-analysis.git
   ```
2. Open `cluster_analysis.R` in RStudio or any R editor.
3. Install the required packages.
4. Run the script to perform the cluster analysis and view results.

## Results
Clusters are formed based on the health-related attributes from the Framingham dataset. Each cluster represents a grouping of individuals with similar health risk factors. Key findings and visualizations are included in the `plots/` folder.

## Future Enhancements
- Explore advanced clustering algorithms.
- Create an interactive dashboard to visualize clusters.




