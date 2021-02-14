library(tidyr)
library(dplyr)
library(readr)
library(data.table)

zipfile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("~/R/Getting & Cleaning Data/G&C Data/Project_Files.zip")) {
        dir.create("~/R/Getting & Cleaning Data/G&C Data")
        download.file(zipfile, destfile = "~/R/Getting & Cleaning Data/G&C Data/Project_Files.zip", method = "curl") }

setwd("~/R/Getting & Cleaning Data/G&C Data")
unzip("Project_Files.zip")

setwd("~/R/Getting & Cleaning Data/G&C Data/UCI HAR Dataset/test")

X_test <- read.delim("X_test.txt", sep = "", header = FALSE)
y_test <- read.delim("y_test.txt", sep = "", header = FALSE)
subject_test <- read.delim("subject_test.txt", sep = "", header = FALSE)
testmainset <- bind_cols(subject_test, y_test, X_test)

setwd("~/R/Getting & Cleaning Data/G&C Data/UCI HAR Dataset/train")

X_train <- read.delim("X_train.txt", sep = "", header = FALSE)
y_train <- read.delim("y_train.txt", sep = "", header = FALSE)
subject_train <- read.delim("subject_train.txt", sep = "", header = FALSE)
trainmainset <- bind_cols(subject_train, y_train, X_train)

mainset <- bind_rows(testmainset,trainmainset)

setwd("~/R/Getting & Cleaning Data/G&C Data/UCI HAR Dataset/test/Inertial Signals")
body_acc_x_test <- read.delim("body_acc_x_test.txt", sep = "", header = FALSE)
body_acc_y_test <- read.delim("body_acc_y_test.txt", sep = "", header = FALSE)
body_acc_z_test <- read.delim("body_acc_z_test.txt", sep = "", header = FALSE)
body_gyro_x_test <- read.delim("body_gyro_x_test.txt", sep = "", header = FALSE)
body_gyro_y_test <- read.delim("body_gyro_y_test.txt", sep = "", header = FALSE)
body_gyro_z_test <- read.delim("body_gyro_z_test.txt", sep = "", header = FALSE)
total_acc_x_test <- read.delim("total_acc_x_test.txt", sep = "", header = FALSE)
total_acc_y_test <- read.delim("total_acc_y_test.txt", sep = "", header = FALSE)
total_acc_z_test <- read.delim("total_acc_z_test.txt", sep = "", header = FALSE)

setwd("~/R/Getting & Cleaning Data/G&C Data/UCI HAR Dataset/train/Inertial Signals")
body_acc_x_train <- read.delim("body_acc_x_train.txt", sep = "", header = FALSE)
body_acc_y_train <- read.delim("body_acc_y_train.txt", sep = "", header = FALSE)
body_acc_z_train <- read.delim("body_acc_z_train.txt", sep = "", header = FALSE)
body_gyro_x_train <- read.delim("body_gyro_x_train.txt", sep = "", header = FALSE)
body_gyro_y_train <- read.delim("body_gyro_y_train.txt", sep = "", header = FALSE)
body_gyro_z_train <- read.delim("body_gyro_z_train.txt", sep = "", header = FALSE)
total_acc_x_train <- read.delim("total_acc_x_train.txt", sep = "", header = FALSE)
total_acc_y_train <- read.delim("total_acc_y_train.txt", sep = "", header = FALSE)
total_acc_z_train <- read.delim("total_acc_z_train.txt", sep = "", header = FALSE)

body_acc_x <- bind_rows(body_acc_x_test, body_acc_x_train)
body_acc_y <- bind_rows(body_acc_y_test, body_acc_y_train)
body_acc_z <- bind_rows(body_acc_z_test, body_acc_z_train)
body_gyro_x <- bind_rows(body_gyro_x_test, body_gyro_x_train) 
body_gyro_y <- bind_rows(body_gyro_y_test, body_gyro_y_train)
body_gyro_z <- bind_rows(body_gyro_z_test, body_gyro_z_train)
total_acc_x <- bind_rows(total_acc_x_test, total_acc_x_train)
total_acc_y <- bind_rows(total_acc_y_test, total_acc_y_train)
total_acc_z <- bind_rows(total_acc_z_test, total_acc_z_train)

dir.create("~/R/Getting & Cleaning Data/G&C Data/UCI HAR Dataset/Merged")
write_delim(mainset, "~/R/Getting & Cleaning Data/G&C Data/UCI HAR Dataset/Merged/mainset.txt", delim = " ")
write_delim(body_acc_x, "~/R/Getting & Cleaning Data/G&C Data/UCI HAR Dataset/Merged/body_acc_x.txt", delim = " ")
write_delim(body_acc_y, "~/R/Getting & Cleaning Data/G&C Data/UCI HAR Dataset/Merged/body_acc_y.txt", delim = " ")
write_delim(body_acc_z, "~/R/Getting & Cleaning Data/G&C Data/UCI HAR Dataset/Merged/body_acc_z.txt", delim = " ")
write_delim(body_gyro_x, "~/R/Getting & Cleaning Data/G&C Data/UCI HAR Dataset/Merged/body_gyro_x.txt", delim = " ")
write_delim(body_gyro_y, "~/R/Getting & Cleaning Data/G&C Data/UCI HAR Dataset/Merged/body_gyro_y.txt", delim = " ")
write_delim(body_gyro_z, "~/R/Getting & Cleaning Data/G&C Data/UCI HAR Dataset/Merged/body_gyro_z.txt", delim = " ")
write_delim(total_acc_x, "~/R/Getting & Cleaning Data/G&C Data/UCI HAR Dataset/Merged/total_acc_x.txt", delim = " ")
write_delim(total_acc_y, "~/R/Getting & Cleaning Data/G&C Data/UCI HAR Dataset/Merged/total_acc_y.txt", delim = " ")
write_delim(total_acc_z, "~/R/Getting & Cleaning Data/G&C Data/UCI HAR Dataset/Merged/total_acc_z.txt", delim = " ")

# end of task 1 --> merges the train and test datasets and creates a new one (Merged)

setwd("~/R/Getting & Cleaning Data/G&C Data/UCI HAR Dataset")
features <- read.delim("features.txt", sep = "", header = FALSE)
pattern <- "*[Mm]ean*|*std*"
columnfilter <- grep(pattern, features$V2)
meansstds <- select(mainset, c(1,2,columnfilter+2))

# end of task 2 --> Extracts only the measurements on the mean and standard deviation for each measurement (meansstds)

activity_labels <- read.delim("activity_labels.txt", sep = "", header = FALSE)
meansstdslabeled <- inner_join(activity_labels, meansstds, by = c("V1" = "V1...2"))

# end of task 3 --> Uses descriptive activity names to name the activities in the data set (meansstdslabeled)

collabels <- features[columnfilter,2]
meansstdslabeled %>% setnames(4:89, collabels) %>% setnames(1:3, c("activity", "activity_label", "subject")) %>% setDT
meansstdslabeled <- meansstdslabeled[,activity:= NULL]

# end of task 4 --> Appropriately labels the data set with descriptive variable names

write_delim(meansstdslabeled, "~/R/Getting & Cleaning Data/G&C Data/UCI HAR Dataset/Merged/transformedmainset.txt", delim = " ")

summadataset <- meansstdslabeled
summadataset$subject <- as.character(summadataset$subject)

meandataset <- summadataset %>% group_by(summadataset$activity_label,summadataset$subject) %>% 
        summarise_if(is.numeric, mean) %>% 
        rename('activity_label' = 'summadataset$activity_label') %>% rename('subject' = 'summadataset$subject') 

        meandataset$subject <- as.numeric(meandataset$subject)
        meandataset <- arrange(meandataset, activity_label, subject)

write.table(meandataset, file = "~/R/Getting & Cleaning Data/G&C Data/finalset.txt", row.names = FALSE )

# end of task 5 --> From the data set in step 4, creates a second, independent tidy data set with the average of each 
#                   variable for each activity and each subject.