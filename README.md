# README

## Overview

As required, there are two tidy data sets, a codebook (CodeBook.md) and a run_analysis.R script.

Each dataset fit the standards:

- The first row contains column names. So it have headings.
- Variables are in different columns
- No duplicated columns

Therefore each dataset can be read into R by

```R
read.table(FILE, header = TRUE)
```

## Dataset

The first dataset is  "tidyActivityData.txt". It meets the requirement 1~4.

The second dataset is "processedTidyData.txt". It meets the requirement 5.

## run_analysis.R

Data downloaded from the web should be in the same path as the run_analysis.R script.

Variable "workDir" can be changed to the work directory of the user.



There are notes explaining each line of code. Here I will give some general idea.

The script contains 3 functions: activityName, readData, and processData.

- activityName: This function is called in readData(). It takes a label in test_y.txt or train_y.txt, and returns the activity name.
- readData: This function is coded for requirement 1~4. It reads raw data from the file, process it and return the tidy dataset. For details please check the notes in the script.
- processData: This function is coded for requirement 5. It takes the tidy dataset from readData() and returns the dataset which fits the requirement. Again, for details please check the notes in the script.

2 dataframes will be generate by

```R
activity_data <- readData()
processed_data <- processData(activity_data)
```

later, these two dataframes are written into txt files by

```R
write.table(activity_data,file = "./tidyActivityData.txt",row.names = FALSE)
write.table(processed_data,file = "./processedTidyData.txt",row.names = FALSE)
```

