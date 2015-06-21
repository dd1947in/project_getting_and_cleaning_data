## Synopsis

This project is  developed and submitted to satisfy the requirements of project work for the Coursera - Data  Science Course  "Getting and Cleaning Data". 

## Code Example

The script is written in R . This project is run by setting working directory to this project folder and sourcing the script run_analysis.R . 
e.g. <br>
> setwd("C:/project_folder_containing_script")<br>
>source("run_analysis.R")<br>

## Motivation

This project is submitted for getting project credit in course "Getting and Cleaning Data"

## Installation

No installation is needed. This project uses package 'dplyr'.

## API Reference

This project uses the following APIs for various steps in the project.
download.file()<br>
unzip()<br>
paste()<br>
dir.create()<br>
read.table()<br>
cbind()<br>
rbind()<br>
group_by()<br>
summarise_each()<br>

## Tests

This project is to be evaluated by peers by sourcing the script  "run_analysis.R" preferably in RStudio as displays  console output and Global Environment :
>source("run_analysis.R")
Here is the console output<br>
[1] " ... downloading data set ..."<br>
[1] " ... unzipping the data  set ..."<br>
[1] " ... loading features.txt, activity_labels.txt ..."<br>
[1] " ... loading train set ..."<br>
[1] " ... loading test set ..."<br>
[1] "... cbind participant/subject id's x_test as column V562 ... "<br>
[1] "... cbind participant/subject id's x_train as column V562 ...  "<br>
[1] " ... rbind/combine rows of  test and train tidy data sets ..."<br>
[1] " ... step 1 completed ..."<br>
[1] "... step 2 begin ..."<br>
[1] "...load column_subset_and_map_for_step2.txt ..."<br>
[1] "... get a column vector for subsetting only 73 columns mean & std + subject id ..."<br>
[1] "... get a column vector for renaming with descriptive names ..."<br>
[1] "... subset 73 columns from  test & train merged data set ..."<br>
[1] "... rename 73 columns with descriptive names ..."<br>
[1] "... step 5 begin ..."<br>
[1] "... Grouping measurement by subject id ..."<br>
[1] "...apply mean function to all columns..."<br>
[1] "...write summarized data fram in file...final output in ..."<br>
[1] "getting_and_clearning_data_project_output_final.txt"<br>
## Contributors
This project is submitted for getting academic credit only. 


## License

Not applicable .  Do not copy for submitting it as your own project for academic credit. Free to use for any other purpose.


