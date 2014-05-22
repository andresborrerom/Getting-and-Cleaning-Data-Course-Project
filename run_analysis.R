run_analysis <- function(){
  
  
  #packages and librarys
  library(plyr)
  
  #set calling names
  dir1 <- (getwd())
  print(paste("please make sure the UCI HAR Dataset folder is in", dir1) )
  
  # read all data into working tables
  Xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
  ytest <- read.table("UCI HAR Dataset/test/y_test.txt")  
  Xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
  ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")
  labels <- read.table("UCI HAR Dataset/activity_labels.txt")
  subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
  subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
  
  # create names for data columns
  names(Xtest) <- features[,2]
  names(Xtrain) <- features[,2]
  
  #create subject_* tables to merge with tidy info
  subject_test <- cbind(subject_test, "test")
  names(subject_test) <- c("subject" , "group-partition")
  
  subject_train <- cbind(subject_train, "train")
  names(subject_train) <- c("subject" , "group-partition")
  
  #create label identifyable names for y* files
  names(ytrain) <- "activity"
  names(ytest) <- "activity"
  names(labels) <- c("activity", "activity_name")
  ytrain <- join(ytrain, labels)
  ytest <- join (ytest, labels)
    
  #merge test and train (subject, X, y) tables bu columns
  Xtest <- cbind(ytest[,2], Xtest)
  Xtrain <- cbind(ytrain[,2], Xtrain)
  
  names(Xtest) <- c( "activity_name", names(Xtest[,2:562]))
  names(Xtrain) <- c( "activity_name", names(Xtrain[,2:562]))    
  
  Xtest <- cbind(subject_test, Xtest) 
  Xtrain <- cbind(subject_train, Xtrain)
  
  #merge train and test by rows
  Xtotal <- rbind(Xtest, Xtrain)
  
  # take subset of columns that have mean or std of some measurement. Because of 
  # 'features_info.txt'I know "mean" or "std" will be on the column name (ignoring
  # cases). Include first three columns (subject number, activity, train or test)
  Xmean <- grep("MEAN", names(Xtotal), value = F, ignore.case = T)
  Xstd <- grep("std", names(Xtotal), value = F, ignore.case = T)
  z <- c(1,2,3, Xmean, Xstd)
  Xmeanstd <- Xtotal[,z]
  
  # to name the columns descriptively, following the rules on the first week 
  # 4 lectures, I will change t for time (when at the beggining of the name),
  # f for freqdom (frequency domain according to features_info.txt), taking out 
  # spaces, dots, underscores, end the other rules explain in the mentioned lecture
  
  names(Xmeanstd) <- sub("^t", "time", names(Xmeanstd))
  names(Xmeanstd) <- sub("^f", "freqdom", names(Xmeanstd))
  names(Xmeanstd) <- tolower(names(Xmeanstd))
  names(Xmeanstd) <- sub("_", "-", names(Xmeanstd))
  names(Xmeanstd) <- sub("-", "", names(Xmeanstd))
  names(Xmeanstd) <- sub("()-", "", names(Xmeanstd))
  
  # now, create new  tidy data set with the average of each column for each subject
  # and each activity (names in activity-labels.txt).
  
  
  newTidy1 <- matrix(,180,89) #I need 180 rows as there are 30 subjects and 6 activities
  newTidy1 <- data.frame(newTidy1)
  names(newTidy1) <- names(Xmeanstd)
  
  multiplo = nrow(labels)
  
  
  
  # first, sequence for each subject
  for (i in seq_along(unique(Xmeanstd$subject))){
    #now, sequence for each activity
    for (j  in seq_along(unique(Xmeanstd$activityname))){
      #create subset for each subject+activity subgroup
      p1 <- subset(Xmeanstd, Xmeanstd$subject == i & Xmeanstd$activityname == labels[j,2] )
      
      #assign values to first three columns (subject, train or test, activity name)
      newTidy1[(i-1)*multiplo+j,1]<-i      
      newTidy1[(i-1)*multiplo+j,3]<-as.character(labels[j,2])
      
      newTidy1[(i-1)*multiplo+j,2]<-as.character(p1[1,2])
      
      #now calculate the mean for each of the other columns of the subset and assign it
      newTidy1[(i-1)*multiplo+j,4:89]<-colMeans(p1[,4:89])
      
      
    
    }
  
    
  }
 
# I must export the data set to a file so I can attach it in the course project 
# url. I wil use coma as a separator so it can be read as a csv file.
  for (k in 4:89){
    a <- paste("average",names(newTidy1[k]), sep = "")
    names(newTidy1)[k] <- a
  }
  
  write.table(newTidy1, file = "tidySamsung.txt", sep=",")
  return (newTidy1)
  
}  