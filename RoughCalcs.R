# libraries
library(data.table)
library(dplyr)
library(colormap)

colormaps
# section 1 - cluster analysis
# load data for section 1
trip.advisor <- read.csv(file = 'Data/tripadvisor_review.csv')
# subsection a - perform a hierarchical clust analysis (via Ward's method) using all variables except userID
trip.advisor <- trip.advisor %>% 
  rename(art.galleries = Category.1,
         dance.clubs = Category.2,
         juice.bars = Category.3,
         restaurants = Category.4,
         museums = Category.5,
         resorts = Category.6,
         parks.picnic.spots = Category.7,
         beaches = Category.8,
         theaters = Category.9,
         religious.institutions = Category.10
         )
View(trip.advisor)
## this is a change


d <- dist(trip.advisor[,2:11],method="euclidean")
hier.clust <- hclust(d,method="ward.D")
plot(hier.clust)
groups <- cutree(hier.clust,k=5)
rect.hclust(hier.clust,k=5,border="red")
aggregate(trip.advisor[,2:11],list(groups),FUN=mean)

mydata <- as.matrix(trip.advisor[,2:11])
rownames(mydata) <- trip.advisor[,1]
datascaled <- scale(mydata)
heatmap(datascaled)


# section 2
ad <- read.csv(file = 'Data/adult.data.txt')

ad$education
levels(ad$education)
