library(parallelDist)
library(ggplot2)
#k is number of neighbors
#optimize time:
#			https://scikit-learn.org/stable/modules/neighbors.html#unsupervised-nearest-neighbors
#			we use of BallTree, KDTree, or brute-force algorithm for faster find of nearest neighbour
KNNClustering <- function(data,k=3)
{
  #make distance matrix d
  d <- as.matrix(parDist(x = data, method = "euclidean"))
  diag(d) <- Inf
  #find k minimum of each row of d
  sorted.d.indexes <- apply(d, 1,function(x) sort.int(x,method = "auto", index.return = TRUE)$ix)
  #make clusters according to k,kmax
  is.visited <- rep(FALSE,nrow(data))
  clusters <- rep(0,nrow(data))

  clusters[1] <- 1
  is.visited[1] <- TRUE


  iq=c(1) #instances queue
  iqc=1 #iq counter
  cn=1 # cluster counter
  while (!all(is.visited)) { #while for scrolling instances

    if(iqc>length(iq))
    {
      cn = cn+1
      temp <- which(is.visited==FALSE)[1]
      iq <- c(temp)
      iqc<- 1
      i = iq[iqc] #instance counter
      is.visited[i] <- TRUE
      clusters[i] <- cn
    }

    i = iq[iqc] #instance counter
    neighbours <- sorted.d.indexes[,i]
    ln <- k
    j <-1

    print(paste0(sum(is.visited),"/",nrow(data)))

    while(j<=ln) { # while for scrolling i neighbours
        n <- neighbours[j] # now neighbour
        if(!is.visited[n])
        {
          is.visited[n] <- TRUE
          clusters[n] <- cn
          iq <- c(iq,n)

        }
        if(is.visited[n] & clusters[n]!=cn)
        {
          clusters[clusters==clusters[n]] <- cn
        }
        j <- j+1
    }
    iqc = iqc+1
  }
  clusters <- as.integer(as.factor(clusters))

  return(clusters)
}
