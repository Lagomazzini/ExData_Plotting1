
## This script reads partially the "household_power_consumption.txt" stored 
## previously in folder "data" and creates a new "House_PC_2d.txt" file to use 
## in plot1.R, ..., plot4.R script. It creates data from the dates 2007-02-01 
## and 2007-02-02 (see README.md).

rm(list = ls())

# reading part of the file to have a look into the data first. To read the 
# file, please unzip and store the "household_power_consumption.txt" (README.md) 
# in a "data" directory within your working directory

file <- "./data/household_power_consumption.txt"
initial<- read.csv(file, header = TRUE, 
             nrows = 10, sep = ";" )
View(initial) 

# data starts from "16/12/2006 17:24:00" increasing 1 min per row. Therefore, it is
# possible to make an estimation of how many rows we can skip until the desired date
# and how many rows we have to read.

min <- 24*60 - (17*60+24) # minutes until next day ("17/12/2006").
library(lubridate)
f1 <- dmy("17/12/2006") 
f2 <- ymd("2007-02-01")
daysDiff <- as.integer(f2-f1)

minutesDiff <- min + daysDiff*24* 60
min_per_2day <- 2*24*60

## reading using "min_per_2day" and skipping "minutesDiff" rows. Note adding 1 
## because header is set to FALSE

a<- read.csv(file, header = FALSE, 
             nrows = min_per_2day, sep = ";", skip = minutesDiff+1 )

## adding headers to the subdataset "a"
b <- read.csv(file, header = TRUE, 
             nrows = 1, sep = ";" )
names(a) <- names(initial)
View(a)
## writing to an external file
write.table(a, "./House_PC_2d.txt", row.name = FALSE)


