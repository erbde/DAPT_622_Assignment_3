# libraries
library(data.table)
library(dplyr)

# section 1 - cluster analysis
# load data for section 1
trip.advisor <- read.csv(file = 'Data/tripadvisor_review.csv')
# subsection a - perform a hierarchical clust analysis (via Ward's method) using all variables except userID

# section 2
ad <- read.csv(file = 'Data/adult.data.txt')
