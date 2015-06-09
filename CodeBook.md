# Code book for Getting and Cleaning Data Course Project

## Explaination of run_analysis.R

* Loads "plyr" library
* Load features data set from "features.txt" to be used for column name
* Load activity data set from "activity_labels.txt"
* Load train data set from "x_train.txt", "y_train.txt" & "subject_train.txt"
* Load test data set from "x_test.txt", "y_test.txt" & "subject_test.txt"
* Merge train & test data set
* Apply activity labels in the data set
* Extract subject Id, activity and standard deviation & mean of each measurement into data set
* Create second data set with subjectid, activity & average of each variables
* Update column to reflect the average
* Write data set to a text file


## Variables

* train_data: train data set
* test_data: test data set
* combined_data: merged data set of train & test data set
* dataset: data set that contains subject id, activity and mean & SD of each measurement
* tidydataset: second data set that contains subject id, activity and mean of each variable


## Output: tinydataset.txt

contains 180 observation and 81 variables in csv format.