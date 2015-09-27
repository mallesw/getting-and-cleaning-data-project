#download file, store in data folder
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/Dataset.zip", method = "curl")

#unzip file
unzip(zipfile = "./data/Dataset.zip", exdir = "./data")

#get list of files in UCI HAR dataset
path_ref <- file.path("./data", "UCI HAR Dataset")
files <- list.files(path_ref, recursive = TRUE)


#read activity files
ActivityTest <- read.table(file.path(path_ref, "test", "Y_test.txt"), header = FALSE)
ActivityTrain <- read.table(file.path(path_ref, "train", "Y_train.txt"), header = FALSE)
#read subject files
SubjectTest <- read.table(file.path(path_ref, "test", "subject_test.txt"), header = FALSE)
SubjectTrain <- read.table(file.path(path_ref, "train", "subject_train.txt"), header = FALSE)
#read features files
FeaturesTest <- read.table(file.path(path_ref, "test", "X_test.txt"), header = FALSE)
FeaturesTrain <- read.table(file.path(path_ref, "train", "X_train.txt"), header = FALSE)

#1. Merge training and test sets to create one data set
dataSubject <- rbind(SubjectTrain, SubjectTest)
dataActivity <- rbind(ActivityTrain, ActivityTest)
dataFeatures <- rbind(FeaturesTrain, FeaturesTest)
names(dataSubject) <- c("subject")
names(dataActivity) <- c("activity")
dataFeaturesNames <- read.table(file.path(path_ref, "features.txt"), header = FALSE)
names(dataFeatures) <- dataFeaturesNames$V2

dataCombine <- cbind(dataSubject, dataActivity)
data <- cbind(dataFeatures, dataCombine)

#2. Extract only the measurements on the mean and standard deviation for each measurement
subdataFeaturesNames <- dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]
selectedNames <- c(as.character(subdataFeaturesNames), "subject", "activity")
data <- subset(data, select = selectedNames)

#3. Use descriptive activity names to name the activities in the data set
activityLabels <- read.table(file.path(path_ref, "activity_labels.txt"), header = FALSE)
data$activity <- activityLabels$V2[data$activity]

#4. Appropriately label data set with descriptive variable names
names(data) <- gsub("^t", "time", names(data))
names(data) <- gsub("^f", "frequency", names(data))
names(data) <- gsub("Acc", "Accelerometer", names(data))
names(data) <- gsub("Gyro", "Gyroscope", names(data))
names(data) <- gsub("Mag", "Magnitude", names(data))
names(data) <- gsub("BodyBody", "Body", names(data))

#5. Create second, independent tidy data set and output it
library(plyr)
data2 <- aggregate(. ~subject + activity, data, mean)
data2 <- data2[order(data2$subject, data2$activity),]
write.table(data2, file = "tidydata.txt", row.name = FALSE)
