library(dplyr)
library(data.table)
setwd("/Users/marcelo/Downloads/getting_and_cleaning_data_course_project/data/UCI HAR Dataset")

#read tables
features <- read.table("features.txt")
activities <- read.table("activity_labels.txt")

#load test data
subject_test <- read.table("test/subject_test.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")

#load train data
subject_train <- read.table("train/subject_train.txt")
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")

#combine columns
test_data <- cbind(subject_test, y_test, x_test)
train_data <- cbind(subject_train, y_train, x_train)
#combine rows
merged_data <- rbind(test_data, train_data)

colnames(merged_data) <- c("subject", "activity", as.character(features[,2]))

#mean and sd
selected_features <- grep("-(mean|std)\\(\\)", features[,2])
tidy_subset <- merged_data[, c(1, 2, selected_features + 2)]

#label
tidy_subset$activity <- activities[tidy_subset$activity, 2]

names(tidy_subset) <- gsub("^t", "Time", names(tidy_subset))
names(tidy_subset) <- gsub("^f", "Frequency", names(tidy_subset))
names(tidy_subset) <- gsub("Acc", "Accelerometer", names(tidy_subset))
names(tidy_subset) <- gsub("Gyro", "Gyroscope", names(tidy_subset))
names(tidy_subset) <- gsub("Mag", "Magnitude", names(tidy_subset))
names(tidy_subset) <- gsub("BodyBody", "Body", names(tidy_subset))
names(tidy_subset) <- gsub("-mean\\(\\)", "Mean", names(tidy_subset))
names(tidy_subset) <- gsub("-std\\(\\)", "STD", names(tidy_subset))
names(tidy_subset) <- gsub("-", "", names(tidy_subset))

#aveerage of each variable
tidy_data <- tidy_subset %>%
  group_by(subject, activity) %>%
  summarize_all(list(mean = mean))

#save output as text
write.table(tidy_data, "tidy_dataset.txt", row.name = FALSE)

