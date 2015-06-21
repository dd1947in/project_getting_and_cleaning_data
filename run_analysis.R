# Coursera / Data Science / Getting and Cleaning Data / Project

######Editable Parameters BEGIN###########
#project.dir <- "C:/GettingAndCleaningData"
project.dir <- getwd()
data.dir <- "data"

######Editable Parameters END###########
library(dplyr)
download_data_set <- function(url, destfile)
{
    download.file(url, destfile, method="internal", quiet=TRUE , mode="wb")
  
}
unzip_data_set <- function(zipfile)
{
    unzip(zipfile, files = NULL, list = FALSE, overwrite = TRUE, exdir=data.dir, unzip= "internal", setTimes=TRUE)
}


###########Non-Editable Params#########
#tidy.data.file <- paste(data.dir, "getting_and_clearning_data_project_output_final.txt", sep="/")
tidy.data.file <- "getting_and_cleaning_data_project_final_tidy_data_set.txt"
data.file <- paste(data.dir, "getdata-projectfiles-UCI-HAR-Dataset.zip", sep="/")
data.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
features.txt <- paste(data.dir, "UCI HAR Dataset/features.txt", sep="/")
activity_labels.txt <- paste(data.dir,  "UCI HAR Dataset/activity_labels.txt", sep="/")

x_train.txt <- paste(data.dir,  "UCI HAR Dataset/train/X_train.txt", sep="/")
#y_train.txt <- paste(data.dir,  "UCI HAR Dataset/train/y_train.txt", sep="/")
y_train.txt <- paste(data.dir,  "UCI HAR Dataset/train/subject_train.txt", sep="/") #???

x_test.txt <- paste(data.dir,  "UCI HAR Dataset/test/X_test.txt", sep="/")
#y_test.txt <- paste(data.dir,  "UCI HAR Dataset/test/y_test.txt", sep="/")
y_test.txt <- paste(data.dir,  "UCI HAR Dataset/test/subject_test.txt", sep="/") #???

###########Non-Editable Params#########
# Check and Create "data" dir if necessary
if(!file.exists(data.dir)){
  dir.create(data.dir)
}

#download data set and unzip it in working directory
print (" ... downloading data set ...")
download_data_set(data.url, data.file)

print (" ... unzipping the data  set ...")

unzip_data_set(data.file)


print (" ... loading features.txt, activity_labels.txt ...")
features.tab <- read.table(features.txt)
activity_labels.tab <- read.table(activity_labels.txt)

print (" ... loading train set ...")
x_train.tab <- read.table(x_train.txt)
y_train.tab <- read.table(y_train.txt)

print (" ... loading test set ...")
x_test.tab <- read.table(x_test.txt)
y_test.tab <- read.table(y_test.txt)


#xx_test.tab, xx_train.tab will have column "V562" that will have subject id
print ("... cbind participant/subject id's x_test as column V562 ... ")
xx_test.tab <- cbind(x_test.tab, y_test.tab$V1)
colnames(xx_test.tab)[562] <- "V562"

print ("... cbind participant/subject id's x_train as column V562 ...  ")
xx_train.tab <- cbind(x_train.tab, y_train.tab$V1)
colnames(xx_train.tab)[562] <- "V562"

#Now xx_test.tab & xx_train.tab are tidy data sets  these can be starting point for any analysis

print(" ... rbind/combine rows of  test and train tidy data sets ...")
xx_test_and_train.tab <- rbind(xx_train.tab, xx_test.tab)
#1. Merges the training and the test sets to create one data set.
#It is a tidy data st by itself.
print (" ... step 1 completed ...")

#In step 2 we will load a dataset prepared by this student
#This data set will give us columns to subset in the merged data and the corresponding descriptive names
print ("... step 2 begin ...")
print ("...load column_subset_and_map_for_step2.txt ...")
col_subset_map <- read.table("column_subset_and_map_for_step2.txt", header=TRUE, colClasses=c("integer", "character", "character"))
print ("... get a column vector for subsetting only 73 columns mean & std + subject id ...")
col_names_subset <- col_subset_map$ColumnName
print ("... get a column vector for renaming with descriptive names ...")
col_names_desc <- col_subset_map$ColumnNameDesc
#Now subset columns all mean & std plus subject_id (a.k.a V562)
print ("... subset 73 columns from  test & train merged data set ...")
xx_test_and_train_subset.tab <- xx_test_and_train.tab[,col_names_subset]
print ("... rename 73 columns with descriptive names ...")
colnames(xx_test_and_train_subset.tab) <- col_names_desc
print ("... step 5 begin ...")
#step 5
print ("... Grouping measurement by subject id ...")
xxx_test_and_train_subset.tab <- group_by(xx_test_and_train_subset.tab, Subject_Id)
print ("...apply mean function to all columns...")
xxxx_test_and_train_subset.tab <- xxx_test_and_train_subset.tab %>% summarise_each(funs(mean))
print ("...write summarized data fram in file...final output in ...")
write.table(xxxx_test_and_train_subset.tab, file=tidy.data.file, row.names=FALSE)
print (tidy.data.file)







