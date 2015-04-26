library(doBy)
library(reshape)

## we check if the zipped file exists
if (!file.exists("./UCI")){dir.create("./UCI")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("./UCI/Dataset.zip") ){download.file(fileUrl,
                                                    destfile="./UCI/Dataset.zip", method="curl")}

## unzip file
unzip("./UCI/Dataset.zip", overwrite=T, exdir="./UCI/Dataset/", unzip="internal")
## reading names of variables
   
features <- read.table("./UCI/Dataset/UCI HAR Dataset/features.txt", header=F)

## reading everything on Test folder

#subject
test_subject <- read.table("./UCI/Dataset/UCI HAR Dataset/test/subject_test.txt", header=F)

# X
test.dataset <- read.table("./UCI/Dataset/UCI HAR Dataset/test/X_test.txt", header=F)

# Y
y_test <- read.table("./UCI/Dataset/UCI HAR Dataset/test/y_test.txt", header=F)

# we change the numeric values of activity for one readable
y_test[y_test==1] <- "WALKING"
y_test[y_test==2] <- "WALKING_UPSTAIRS"
y_test[y_test==3] <- "WALKING_DOWNSTAIRS"
y_test[y_test==4] <- "SITTING"
y_test[y_test==5] <- "STANDING"
y_test[y_test==6] <- "LAYING"

#adding the variable names in the columns
names(test.dataset) <- features[,2]

# merging the 3 text files
test.dataset <- cbind(test_subject, y_test, test.dataset)

# we filter for only "mean" and "std" in the dataset
test.dataset <- test.dataset[sort(c(1,2,
                                    grep("mean", names(test.dataset), fixed=T), 
                                    grep("std", names(test.dataset), fixed=T)))]

# changing variable names for a readable one
names(test.dataset) <- gsub("[[:punct:]]", "", names(test.dataset))
names(test.dataset) <- gsub("mean", "-m-", names(test.dataset))
names(test.dataset) <- gsub("std", "-s-", names(test.dataset))
names(test.dataset) <- gsub("X", "-x", names(test.dataset))
names(test.dataset) <- gsub("Y", "-y", names(test.dataset))
names(test.dataset) <- gsub("Z", "-z", names(test.dataset))
names(test.dataset) <- gsub("B", "b", names(test.dataset))
names(test.dataset) <- gsub("A", "a", names(test.dataset))
names(test.dataset) <- gsub("J", "j", names(test.dataset))
names(test.dataset) <- gsub("F", "f", names(test.dataset))
names(test.dataset) <- gsub("G", "g", names(test.dataset))
names(test.dataset) <- gsub("jerk", "-jerk-", names(test.dataset))
names(test.dataset) <- gsub("gyro", "-gyro-", names(test.dataset))
names(test.dataset) <- gsub("acc", "-acc-", names(test.dataset))



## Reading everything on Train folder

#subject
train_subject <- read.table("./UCI/Dataset/UCI HAR Dataset/train/subject_train.txt", header=F)

# X
train.dataset <- read.table("./UCI/Dataset/UCI HAR Dataset/train/X_train.txt", header=F)

# Y
y_train <- read.table("./UCI/Dataset/UCI HAR Dataset/train/y_train.txt", header=F)

# we change the numeric values of activity for one readable
y_train[y_train==1] <- "WALKING"
y_train[y_train==2] <- "WALKING_UPSTAIRS"
y_train[y_train==3] <- "WALKING_DOWNSTAIRS"
y_train[y_train==4] <- "SITTING"
y_train[y_train==5] <- "STANDING"
y_train[y_train==6] <- "LAYING"

#adding the variable names in the columns
names(train.dataset) <- features[,2]

# merging the 3 files
train.dataset <- cbind(train_subject, y_train, train.dataset)

# filtering, using only "mean" and "std"
train.dataset <- train.dataset[sort(c(1,2,
                                    grep("mean", names(train.dataset), fixed=T), 
                                    grep("std", names(train.dataset), fixed=T)))]

# changing variable names for a readable one
names(train.dataset) <- gsub("[[:punct:]]", "", names(train.dataset))
names(train.dataset) <- gsub("mean", "-m-", names(train.dataset))
names(train.dataset) <- gsub("std", "-s-", names(train.dataset))
names(train.dataset) <- gsub("X", "-x", names(train.dataset))
names(train.dataset) <- gsub("Y", "-y", names(train.dataset))
names(train.dataset) <- gsub("Z", "-z", names(train.dataset))
names(train.dataset) <- gsub("B", "b", names(train.dataset))
names(train.dataset) <- gsub("A", "a", names(train.dataset))
names(train.dataset) <- gsub("J", "j", names(train.dataset))
names(train.dataset) <- gsub("F", "f", names(train.dataset))
names(train.dataset) <- gsub("G", "g", names(train.dataset))
names(train.dataset) <- gsub("jerk", "-jerk-", names(train.dataset))
names(train.dataset) <- gsub("gyro", "-gyro-", names(train.dataset))
names(train.dataset) <- gsub("acc", "-acc-", names(train.dataset))



## merging the two data sets
merged.df <- merge(test.dataset, train.dataset, all=T)

## renaming the first two variables
colnames(merged.df)[1] <- "subject"
colnames(merged.df)[2] <- "activity"

## transforming the data frame so we convert the variable names (except "subject" and "activity") into rows
t <- melt(merged.df, id=c("subject","activity"))

## obtaining the average
t1 <- summaryBy(value ~ subject + activity + variable, data=t, FUN=mean)
colnames(t1)[colnames(t1)=="value.mean"] <- "mean"

write.table(t1, "./UCI/tidyData.txt", sep="\t", row.names=FALSE) 




