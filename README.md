# KNNClustering
# K-Nearest Neighbors Clustering

This project utilizes the K-Nearest Neighbors (KNN) clustering method, a potentially novel approach for clustering datasets. The method takes two inputs: the dataset and the parameter \( k \), which represents the number of neighbors for each sample. The algorithm then returns the identified clusters.

Here's how the algorithm works:

1. **Initialization**: Start with the first sample and place it in a new cluster (Cluster X).

2. **Finding Neighbors**: Identify the \( k \) nearest neighbors of this initial sample and assign them to Cluster X.

3. **Expanding the Cluster**: For each of the \( k \) nearest neighbors, repeat the process of finding their \( k \) nearest neighbors and adding them to Cluster X (Samples that have already been added to Cluster X can also be considered as nearest neighbors.). Continue this iterative process, expanding the cluster to include all reachable samples.

4. **Closing the Cluster**: The cluster is closed once no new samples can be added (i.e., all reachable neighbors have already been clustered).

5. **Starting a New Cluster**: Find the next unclustered sample and start a new cluster. Repeat the above steps.

6. **Merging Clusters**: If a sample that is already part of an existing cluster is found during the process, the new cluster is merged with the existing cluster.

7. **Completion**: The algorithm continues until every sample in the dataset has been clustered.

By following this method, the KNN clustering algorithm ensures that all samples are grouped based on their proximity to one another, forming coherent clusters throughout the dataset.
