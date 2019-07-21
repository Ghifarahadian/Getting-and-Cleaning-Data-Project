# Getting-and-Cleaning-Data-Project

The code run_analysis.R reads six files in total: three in train folder and three in test folder. Each folder has 'subject', 'X', and 'y' file. After those files are read, pairs of train files and text files are merged with each other. Afterwards, 'X' file

What the script does:
- Read six data files: three ('subject', 'X', and 'y') in train folder and three in test folder
- Read two config files: 'features' and 'activity_labels'
- Merge pairs of train files and text files with each other
- Label 'X' with the feature name from 'features' file
- Choose only 'mean' and 'std' from the 'X' file
- Append 'subject' and 'y' (now we refer 'y' as 'activity') to 'X' as new column
- Change 'activity' from numerical code to the activity label according to 'activity_labels
- By using for loop, get the feature averages for every subject and activity and put the result in one data frame
- Save the data frame as "tidy_data_average.txt"

To run the script, run it at the current directory. Moving the script to another directory will cause the script to be unable to read the necessary files. If the script runs successfully, the output file will be generated at the same directory.
