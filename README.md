Getting-and-Cleaning-Data-Course-Project
========================================

Getting and Cleaning data course project

Important comments:

1. The column names were edited to what the first lecture of the week 4 lectures explained as "appropriate" on its last page.
2. The program asks for you to save the unzipped folder in your working directory.
3. The program will create a txt file in your working directory, which can be read with "read.csv", and will return the database in R.

This is what the program does step by step vs the instructions.

You should create one R script called run_analysis.R that does the following. 

    Merges the training and the test sets to create one data set Read the README.txt file in the UCI HAR Dataset folder. There you will understand which files you should read with R studio into data frames from the train and test folders, work on them parallely using the common names in the features file. (I did not use the Inertial Signals folders at all). After doing all of this, you can merge the dataframes into the one dataset the question asks for.
    Extracts only the measurements on the mean and standard deviation for each measurement. The features_info.txt file will give you a clue on how to find the columns that contain mean and standard deviation info. I created a subset extracting these columns (and the columns I need to merge like subject (subject number), group partition (train or test), and activity (sitting, walking, etc).  I recommend reading ahead into the week 4 lectures to do this part, it REALLY helps (specially the first lecture).
     
    Uses descriptive activity names to name the activities in the data set  The activity (sitting, walking) is numbered in the original test and train files. Use the activity_labels.txt file to change these numbers into their corresponding names, which clearly describe the activity. 
    Appropriately labels the data set with descriptive activity names. This was the instruction tha I found more vague, and I read a lot of different ideas around it. Because there are a lot of differente rules on different bibliography, I decided to use the first video lecture of week 4 to decide what "appropriate" was. Forget the reuse of the word "activity" as it refers to all the columns and not the sitting, walking, etc column. Also, use the text editing functions you will learn there to create the new column names, ONLY for the data set you have now (the subset after step 2).
    Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  Here, I created subgroups by subject and activity (these generates 180 subgroups as there are 30 subjects and 6 activities). For each subgroup there must be a row in this new data set, with the mean of each column of each subgroup. My tidy data set included 89 columns (first three were subject, group partition (train or test) and activity name, and the other 86 were the means of each column of each sobgroup.)



Andres Borrero.
Please, refer any questions to andres.borrerom@gmail.com
