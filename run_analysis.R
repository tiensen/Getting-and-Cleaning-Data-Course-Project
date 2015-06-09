library(plyr)

# Load the features data set for column name
features <- read.table("./features.txt", sep = "", stringsAsFactors = FALSE)

# Load the activity label data set
activity_label <- read.table("./activity_labels.txt", sep = "", stringsAsFactors = FALSE)

# Load the train data sets
train_subject_data <- read.table("train/subject_train.txt", sep = "", stringsAsFactors = FALSE, 
                                 col.names = "subjectid")
train_y_data <- read.table("train/y_train.txt", sep = "", stringsAsFactors = FALSE, 
                           col.names = "activity")
train_x_data <- read.table("train/x_train.txt", sep = "", stringsAsFactors = FALSE, 
                           col.names = features$V2)
train_data <- cbind(train_subject_data, train_y_data, train_x_data)
  
# Load the test data sets
test_subject_data <- read.table("test/subject_test.txt", sep = "", stringsAsFactors = FALSE, 
                                col.names = "subjectid")
test_y_data <- read.table("test/y_test.txt", sep = "", stringsAsFactors = FALSE, 
                          col.names = "activity")
test_x_data <- read.table("test/x_test.txt", sep = "", stringsAsFactors = FALSE, 
                          col.names = features$V2)
test_data <- cbind(test_subject_data, test_y_data, test_x_data)

# Merge the train and test data sets into single data set
combined_data <- rbind(train_data, test_data)

# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive activity names.
combined_data$activity <- factor(combined_data$activity, levels = activity_label$V1, 
                                 labels = activity_label$V2)

# Extracts only the measurements on the mean and standard deviation for each measurement
dataset <- combined_data[,c(1, 2, grep("std", colnames(combined_data)), 
                            grep("mean", colnames(combined_data)))]

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidydataset <- ddply(dataset, .(subjectid, activity), .fun = function(x){ colMeans(x[, c(3:ncol(dataset))]) })

# Update column name
colnames(tidydataset)[c(3:ncol(dataset))] <- paste(colnames(tidydataset)[c(3:ncol(dataset))], "-mean", sep = "")

# Save tidy dataset2 into results folder
write.table(tidydataset, "./tinydataset.txt", row.name = FALSE)