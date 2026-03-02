# getting_and_cleaning_data_course_project

This code book describes the variables, the data, and the transformations performed to clean the "Human Activity Recognition Using Smartphones" dataset.

The raw data was collected from the accelerometers and gyroscopes of Samsung Galaxy S II smartphones worn by 30 subjects. The data was originally partitioned into "test" and "training" sets.

The final dataset consists of 180 observations (30 subjects $\times$ 6 activities).
Subject: The ID of the participant, ranging from 1 to 30.
Activity: The descriptive name of the activity performed: walking, walking_upstairs, walking_downstairs, sitting, standing, laying

All measurement variables are the average of the mean or standard deviation of that specific signal for each subject and activity. Example: TimeBodyAccelerometerMeanX represents the average time-domain body acceleration on the X-axis.

Measurement Units
Accelerometer signals (linear acceleration) are in standard gravity units 'g'.
Gyroscope signals (angular velocity) are in radians/second.
All features are normalized and bounded within [-1, 1].

Transformations and Cleaning
- Merged X_train.txt, y_train.txt, and subject_train.txt using cbind, then merged the resulting training and test sets using rbind.
- Used grep to subset only columns containing mean() or std().
- Replaced numeric activity codes with descriptive strings from activity_labels.txt.
- Renamed variables using gsub to be human-readable: t -> Time, f -> Frequency, Acc -> Accelerometer, Gyro -> Gyroscope, Mag -> Magnitude
