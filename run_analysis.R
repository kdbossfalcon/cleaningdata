##This R file assume the data for analysis is unzipped and located in
##the working directory

##load library "tidyverse"
library(tidyverse)

##Read all data into R by thier respective name
##Activity label
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
##Features label
features <- read.table("./UCI HAR Dataset/features.txt")
##Data on test subject 1-30
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
##Data on train subject 1-10
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
##Test set
set_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
##Train set
set_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
##Test label
label_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
##Train label
label_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

##Start of merging process

##Merge test and train set together, assign to "set"
##Then remove set_test and set_train to clear memory
set <- rbind(set_test, set_train)
rm(set_test, set_train)

##Merge test and train label together, assign to "label"
##Then remove label_test and label_train to clear memory
label <- rbind(label_test, label_train)
rm(label_test, label_train)

##Merge test and train subject together, assign to "subject"
##Then remove subject_test and subject_train to clear memory
subject <- rbind(subject_test, subject_train)
rm(subject_test, subject_train)

##Rename column V1 on "subject" to subject
subject <- rename(subject, subject = V1)

##Rename column V1 on "label" to activity
label <- rename(label, activity = V1)

##create vector from matching of cells in label$activity and activity$subject
##and change to lowercase
activity_list <- tolower(activity[match(label$activity,activity$V1), 2])

##mutate activity column on label from integer to character
##then remove activity to clear memory
label <- mutate(label, activity = activity_list)
rm(activity, activity_list)

##Identify which column to keep by identify mean or std in variable
keep_col <- grep("mean\\(\\)|std\\(\\)", features$V2)
##Store column name to keep in col_name vector
col_name <- grep("mean\\(\\)|std\\(\\)", features$V2, value = TRUE)
col_name <- gsub("[-()]","",col_name)
##Select column from set using keep_col vector
set <- select(set, keep_col)
##Rename variables to be descriptive
names(set) = col_name

##cbind subject, label and set data frames together
data <- cbind(subject, label, set)

##Create tidy data with average of each variable for each activity and subjects
data2 <- data
data2 <- data2 %>%
  group_by(subject, activity) %>%
  summarize(across(.cols = 1:66, mean))

##Final product is data2, write into text file
write.table(data2, file = "finaldata.txt", row.name=FALSE)