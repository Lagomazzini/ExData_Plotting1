## This script reproduced plot2.png file in the repository

## Reading the 2 days selected data (see README.md file in the repo) 
file <- "./House_PC_2d.txt"
a <- read.table(file, header = TRUE)

# Adding to the values of column "Date" the values of column "Time" and 
# converting all to POSIXlt format using strptime().

a$Date <- paste(a$Date, a$Time)

orFormatDate <- Sys.setlocale
Sys.setlocale("LC_TIME", "C")   # changing date format to english
a$Date <- strptime(a$Date, "%d/%m/%Y %H:%M:%S")

## The next code part opens a "png" graphic device and plots the Global active power
## data as a function of Date

png(file = "plot2.png")
plot(a$Date, a$Global_active_power, type = "n",
     xlab = "", ylab ="Global Active Power (kilowatts)")
lines(a$Date, a$Global_active_power)
dev.off()


Sys.setlocale() ## changing to your local settings again
