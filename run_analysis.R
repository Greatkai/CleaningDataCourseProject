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

#This function read both test and train data, and put them into a tidy dataset
readData <- function()
{
        #read test data from txt file
        test_x <- read.table("./UCI HAR Dataset/test/X_test.txt")
        test_y <- read.table("./UCI HAR Dataset/test/y_test.txt")
        test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
        
        #calculate required data
        test_x_mean <- apply(test_x, 1, mean) #calculate the average of each observation
        test_x_std <- apply(test_x, 1, sd) #calculate the standard deviation of each observation
        #rename the columun names into a descriptive ones
        test_subject <- rename(test_subject, subject = V1)
        test_y <- rename(test_y, activity = V1)
        
        #create test dataset
        test_data <- cbind(test_subject,test_x_mean,test_x_std,test_y)
        test_data <- rename(test_data, xmean = test_x_mean, xstd = test_x_std)
        
        #read train data and process it in the same way above
        train_x <- read.table("./UCI HAR Dataset/train/X_train.txt")
        train_y <- read.table("./UCI HAR Dataset/train/y_train.txt")
        train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
        
        train_x_mean <- apply(train_x, 1, mean)
        train_x_std <- apply(train_x, 1, sd)
        train_subject <- rename(train_subject, subject = V1)
        train_y <- rename(train_y, activity = V1)
        
        train_data <- cbind(train_subject,train_x_mean,train_x_std,train_y)
        train_data <- rename(train_data, xmean = train_x_mean, xstd = train_x_std)
        
        #bind test data and train data
        all_data <- rbind(test_data,train_data)
        #take the code of activities and change it into descriptive activity name
        all_data$activity = sapply(all_data$activity, activityName)
        
        all_data #return the tidy dataset
}

processData <- function(activity_data)
{
        #get subjects' names and activities's names
        subjects <- unique(activity_data$subject)
        activities <- unique(activity_data$activity)
        
        id = 1; #to keep track of the row of data
        subject <- c() #to record subject of each row
        activity <- c() #to record activity name of each row
        xmean <- c() #to record average xmean of each row
        xstd <- c() #to record average xstd of each row
        
        #for each subject and each activity, calculate the average of each variable
        for(sub in subjects)
        {
                for(act in activities)
                {
                        spec_data <- activity_data[which(activity_data$subject == sub & activity_data$activity == act),]
                        subject[[id]] <- sub
                        activity[[id]] <- act
                        xmean[[id]] <- mean(spec_data$xmean)
                        xstd[[id]] <- mean(spec_data$xstd)
                        id <- id + 1
                }
        }
        
        #create data frame and sort it
        rawdata <- data.frame(subject,activity,xmean,xstd)
        sortedData <- arrange(rawdata,subject)
        
        sortedData
}

library(dplyr)

#workDir is the project path, user can change it
workDir <- "/Users/user/Desktop/Data\ Science/Getting and Cleaning Data/Course Project"
setwd(workDir)

#get the tidy dataset
activity_data <- readData()
write.table(activity_data,file = "./tidyActivityData.txt",row.names = FALSE)

#get the processed dataset
processed_data <- processData(activity_data)
write.table(processed_data,file = "./processedTidyData.txt",row.names = FALSE)