## Synopsis

This project is  developed and submitted to satisfy the requirements of project work for the Coursera - Data  Science Course  "Getting and Cleaning Data". 

## Code Example

The script is written in R . This project is run by setting working directory to this project folder and sourcing the script run_analysis.R . 
e.g. 
> setwd("C:/project_folder_containing_script")
>source("run_analysis.R")

## Motivation

This project is submitted for getting project credit in course "Getting and Cleaning Data"

## Installation

No installation is needed. This project uses package 'dplyr'.

## API Reference

This project uses the following APIs for various steps in the project.
download.file()
unzip()
paste()
dir.create()
read.table()
cbind()
rbind()
group_by()
summarise_each()

## Tests

This project is to be evaluated by peers by sourcing the script  "run_analysis.R" preferably in RStudio as displays  console output and Global Environment :
>source("run_analysis.R")
Here is the console output<br>
[1] " ... downloading data set ..."<br>
[1] " ... unzipping the data  set ..."
[1] " ... loading features.txt, activity_labels.txt ..."
[1] " ... loading train set ..."
[1] " ... loading test set ..."
[1] "... cbind participant/subject id's x_test as column V562 ... "
[1] "... cbind participant/subject id's x_train as column V562 ...  "
[1] " ... rbind/combine rows of  test and train tidy data sets ..."
[1] " ... step 1 completed ..."
[1] "... step 2 begin ..."
[1] "...load column_subset_and_map_for_step2.txt ..."
[1] "... get a column vector for subsetting only 73 columns mean & std + subject id ..."
[1] "... get a column vector for renaming with descriptive names ..."
[1] "... subset 73 columns from  test & train merged data set ..."
[1] "... rename 73 columns with descriptive names ..."
[1] "... step 5 begin ..."
[1] "... Grouping measurement by subject id ..."
[1] "...apply mean function to all columns..."
[1] "...write summarized data fram in file...final output in ..."
[1] "getting_and_clearning_data_project_output_final.txt"
## Contributors
This is project submitted for getting academic credit only. 


## License

Not applicable .  Do not copy for submitting it as your own project for academic credit. Free to use for any other purpose.


