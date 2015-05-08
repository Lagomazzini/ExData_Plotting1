## This script reproduced plot4.png file in the repository

## Reading the 2 days selected data (see README.md file in the repo) 
file <- "./House_PC_2d.txt"
a <- read.table(file, header = TRUE)

# Adding to the values of column "Date" the values of column "Time" and 
# converting all to POSIXlt format using strptime().

a$Date <- paste(a$Date, a$Time)
Sys.setlocale("LC_TIME", "C")   # changing date format to english
a$Date <- strptime(a$Date, "%d/%m/%Y %H:%M:%S")

## The next code part opens a "png" graphic device and plots four graphs

png(file = "plot4.png")
par(mfrow = c(2, 2))
# graph1
plot(a$Date, a$Global_active_power, type = "n",
     xlab = "", ylab ="Global Active Power")
        lines(a$Date, a$Global_active_power)
# graph2
plot(a$Date, a$Voltage, type = "n",
     xlab = "datetime", ylab ="Voltage")
lines(a$Date, a$Voltage)
# graph3
plot(a$Date, a$Sub_metering_1, type = "n",
     xlab = "", ylab ="Energy sub metering")
        lines(a$Date, a$Sub_metering_1)
        lines(a$Date, a$Sub_metering_2, col = "red")
        lines(a$Date, a$Sub_metering_3, col = "blue")
        legend("topright", lty = "solid", col = c("black","red", "blue"), 
               legend = names(a)[7:9], bty = "n" )  
# graph4      
plot(a$Date, a$Global_reactive_power, type = "n",
     xlab = "datetime", ylab ="Global_reactive_power")
lines(a$Date, a$Global_reactive_power)
dev.off()

Sys.setlocale() ## changing to your local settings again