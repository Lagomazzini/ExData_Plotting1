## This script reproduced plot1.png file in the repository

## Reading the 2 days selected data (see README.md file in the repo)
file <- "./House_PC_2d.txt"
a <- read.table(file, header = TRUE)

## The next code part opens a "png" graphic device and plots the Global active power
## data as a function of Date
png(file = "plot1.png")
hist(a$Global_active_power, xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power", col = "red1",
     xaxp = c(0,6,3))
dev.off()



