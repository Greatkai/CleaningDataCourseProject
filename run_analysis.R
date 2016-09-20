#By Kevin Zhang

#convert numbers to labels
#labels are found in activity_labels.txt
activityName <- function(num)
{
        activityNames <- c("WALKING",
                           "WALKING_UPSTAIRS",
                           "WALKING_DOWNSTAIRS",
                           "SITTING",
                           "STANDING",
                           "LAYING")
        activityNames[[num]]
}

#This function read both test and train data, extract required data and put them into a tidy dataset
readData <- function()
{
        #read features and figure out which ones are required
        features <- read.table("./UCI HAR Dataset/features.txt")
        required_features <- grep("-mean()|-std()",features[,2])
        tidy_names <- tolower(features[,2])
        tidy_names <- gsub("[-()]","",tidy_names)
        
        #read test data from txt file
        test_x <- read.table("./UCI HAR Dataset/test/X_test.txt")
        test_y <- read.table("./UCI HAR Dataset/test/y_test.txt")
        test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
        
        #get required data
        required_test_x <- test_x[,required_features]
        
        #create test dataset
        test_data <- cbind(test_subject,test_y,required_test_x)
        
        #read train data and process it in the same way above
        train_x <- read.table("./UCI HAR Dataset/train/X_train.txt")
        train_y <- read.table("./UCI HAR Dataset/train/y_train.txt")
        train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

        required_train_x <- train_x[,required_features]
        
        train_data <- cbind(train_subject,train_y,required_train_x)
        
        #bind test data and train data
        all_data <- rbind(test_data,train_data)
        colnames(all_data) <- c("subject","activity",tidy_names[required_features])
        #take the code of activities and change it into descriptive activity name
        all_data$activity = sapply(all_data$activity, activityName)
        
        all_data #return the tidy dataset
}

processData <- function(activity_data)
{
        # creates a second, independent tidy data set with the average of each 
        # variable for each activity and each subject
        activity_data$subject <- as.factor(activity_data$subject)
        activity_data$activity <- as.factor(activity_data$activity)
        meltdata <- melt(activity_data,id = c("subject","activity"))
        rawdata <- dcast(meltdata, subject + activity ~ variable, mean)
        sortedData <- arrange(rawdata,subject)
        
        sortedData
}

library(dplyr)
library(reshape2)

#workDir is the project path, user can change it
workDir <- "/Users/user/Desktop/Data\ Science/Getting and Cleaning Data/Course Project/CleaningDataCourseProject/"
setwd(workDir)

#get the tidy dataset
activity_data <- readData()

#get the processed dataset
processed_data <- processData(activity_data)
write.table(processed_data,file = "./processedTidyData.txt",row.names = FALSE)