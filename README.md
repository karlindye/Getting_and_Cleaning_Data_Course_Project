# Getting_and_Cleaning_Data_Course_Project

## Introduction
This project processes and analyzes data collected from experiments carried out with a group of 30 volunteers (subjects) who performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

The analysis txt file produced provides the mean of the standard deviaton and mean measures for each grouping of Subject ID and Activity.


## Repo Contents
This repo contains the following:
* A script titled `run_analysis.R` that loads, processes, and produces a file titled "AnalyzedData.txt" analyzing data from the Human Activity Recognition Using Smartphones Dataset.
* A Codebook describing the data contained in the "AnalyzedData.txt" file.


## Data Processing
The raw data Human Activity Recognition Using Smartphones dataset contains the following relevant files:
* `X_train.txt` & `X_test.txt` - These files together contain the measure values for each observation in the experiment.
* `y_train.txt` & `y_test.txt` - These files together contain the Activity ID for each observation in the experiment.
* `activity_labels.txt` - This file contains the Activity ID and corresponding Activity Label or Name.
* `features.txt` - This file contains the Measure Labels or Names.


The `run_analysis.R` script processes the data in stages as follows:
####STAGE 0 - Install And Load Libraries For Processing and Analyzing Data
1. Install Packages For Cleaining Data
2. Load Packages For Cleaining Data

####STAGE 1 - Reading All Data Files Into Data Frames
1. Test Data
2. Training Data
3. Metadata

####STAGE 2 - Cleaning The Data
1. Add Column Names (Descriptive Variable Names) to Data Frames
2. Add the Activity Column to the Data Frames
3. Add the Subject ID Column to the Data Frames
4. Merge the Test And Training Data Frames

####STAGE 3 - Subsetting The Data
1. Create Vector For Index of Columns to Keep
2. Subset to Include Only Columns Needed for Analysis

####STAGE 4 - Analyzing The Data
1. Group Data By SubjectID and Activity and Calculate the Mean for Each Measure
2. Prepend Each Measure Name (Measure Column Name) with Mean to Indicate the Value is The Mean

####STAGE 5 - Exporting (Writing) Analyzed Data to Txt
1. Write Analysis Data Frame to Txt


## Reproducing The Analysis

1. Clone this repo
2. Download the [Human Activity Recognition Using Smartphones Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
3. Unzip the file and place the following files in your working directory: `X_train.txt`, `X_test.txt`, `y_train.txt`, `y_test.txt`, `activity_labels.txt`, `features.txt`.
4. Place the `run_analysis.R` in your working directory and source it in RStudio to execute it.
5. The output "AnalyzedData.txt" file will be produced and placed in your working directory.
