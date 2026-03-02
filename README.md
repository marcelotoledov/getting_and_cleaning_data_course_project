I created this project to take raw sensor data from Samsung smartphones and turn it into a clean, easy-to-read summary. 
The original data was spread across multiple files, so I wrote a script to put it all together into one "tidy" dataset.

How to use it
The folder UCI HAR Dataset has to be in your R working directory.
Run the script run_analysis.R.
The script will automatically create a file called tidy_dataset.txt.

How the run_analysis.R works
Merging: I combined Subject, Activity, and Feature files for both the test and train groups into one table.
Selecting: I used grep to keep only the columns that measure Mean or Standard Deviation.
Naming: I swapped the activity numbers (1-6) for real names like "WALKING" so the data makes sense.
Cleaning Labels: I renamed the columns to be more readable. For example, changing "t" to "Time" and "Acc" to "Accelerometer".
Summarizing: Finally, I grouped the data by person and activity to find the average for every measurement.

This dataset is tidy because each variable has its own column, each observation is in its own row, 
and the variable names make sense and are easy.
