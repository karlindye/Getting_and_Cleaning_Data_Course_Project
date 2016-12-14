#-----------------------------------------------------------------------------------#
#---------------------- Getting and Cleaning Data Assignement ----------------------#
# ----------------------------------------------------------------------------------#

# This script processes and analyzes data collected from experiments 
# carried out with a group of 30 volunteers (subjects) who performed six activities 
# (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) 
# wearing a smartphone (Samsung Galaxy S II) on the waist.
#
# The analysis csv file produced provides the mean of the standard 
# deviaton and mean measures for each grouping of Subject ID and Activity.
#
#
# A full description of the experiment and data is available at the site where 
# the data was obtained:
#
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#


# STAGE 0 --- Install And Load Libraries For Processing and Analyzing Data ---------#
# ----------------------------------------------------------------------------------#


# Install Packages For Cleaining Data 


#install.packages("dplyr")

#install.packages("tidyr")


# Load Packages For Cleaining Data 


library(dplyr)

library(tidyr)


# STAGE 1 -------- Reading All Data Files Into Data Frames -------------------------#
# ----------------------------------------------------------------------------------#


# Test Data

SubTest_Raw <- read.table("./subject_test.txt")

XTest_Raw <- read.table("./X_test.txt")

YTest_Raw <- read.table("./y_test.txt")


# Training Data

SubTrain_Raw <- read.table("./subject_train.txt")

XTrain_Raw <- read.table("./X_train.txt")

YTrain_Raw <- read.table("./y_train.txt")


# Metadata

ActLabels_Raw <- read.table("./activity_labels.txt")

Features_Raw <- read.table("./features.txt")


# STAGE 2 -------- Cleaning The Data -----------------------------------------------#
# ----------------------------------------------------------------------------------#


# Add Column Names (Descriptive Variable Names) to Data Frames

colnames(XTest_Raw) <- Features_Raw[,2]

colnames(XTrain_Raw) <- Features_Raw[,2]


# Add the Activity Column to the Data Frames

YTest_Raw <- merge(YTest_Raw, ActLabels_Raw, "V1", all.x = TRUE )

YTrain_Raw <- merge(YTrain_Raw, ActLabels_Raw, "V1", all.x = TRUE )

XTest_Raw <- cbind(YTest_Raw[,2], XTest_Raw)

XTrain_Raw <- cbind(YTrain_Raw[,2], XTrain_Raw)

colnames(XTest_Raw)[1] <- "Activity"

colnames(XTrain_Raw)[1] <- "Activity"


# Add the Subject ID Column to the Data Frames

XTest_Raw <- cbind(SubTest_Raw[,1], XTest_Raw)

XTrain_Raw <- cbind(SubTrain_Raw[,1], XTrain_Raw)

colnames(XTest_Raw)[1] <- "SubjectID"

colnames(XTrain_Raw)[1] <- "SubjectID"


# Merge the Test And Training Data Frames

XData_Merged <- rbind(XTrain_Raw, XTest_Raw)



# STAGE 3 -------- Subsetting The Data ---------------------------------------------#
# ----------------------------------------------------------------------------------#


# Create Vector For Index of Columns to Keep

ColIndex <- c(
                1:2                                        # Index for Subject ID and Activity
                , grep("std\\(\\)", names(XData_Merged))   # Index for standard deviation measurements 
                , grep("mean\\(\\)", names(XData_Merged))  # Index for mean measurements
             )


# Subset with ColIndex to Include Only Columns Needed for Analysis

ProcessedData <- XData_Merged[,ColIndex]



# STAGE 4 -------- Analyzing The Data ----------------------------------------------#
# ----------------------------------------------------------------------------------#


# Group Data By SubjectID and Activity and Calculate the Mean for Each Measure

AnalyzedData <- ProcessedData %>%
                group_by(SubjectID,Activity) %>%
                summarize_each(funs(mean)) %>%
                arrange(SubjectID, Activity)

# Prepend Each Measure Name (Measure Column Name) with Mean to Indicate the Value
# is The Mean

colnames(AnalyzedData)[3:68] <- paste0("mean-", names(AnalyzedData[,3:68]))


# STAGE 5 -------- Exporting (Writing) Analyzed Data to CSV ------------------------#
# ----------------------------------------------------------------------------------#

# Write Analysis Data Frame to CSV

write.csv(AnalyzedData, file = "AnalyzedData.csv")
