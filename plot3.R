## This script reproduced plot3.png file in the repository
        
        ## Reading the 2 days selected data (see README.md file in the repo) 
        file <- "./House_PC_2d.txt"
a <- read.table(file, header = TRUE)

        # Adding to the values of column "Date" the values of column "Time" and 
        # converting all to POSIXlt format using strptime().
        a$Date <- paste(a$Date, a$Time)
Sys.setlocale("LC_TIME", "C")   # changing date format to english
                                
        a$Date <- strptime(a$Date, "%d/%m/%Y %H:%M:%S")

        ## The next code part opens a "png" graphic device and plots the three  
        ## "sub_metering" variables as a function of the date.
        
        png(file = "plot3.png")
plot(a$Date, a$Sub_metering_1, type = "n",
           xlab = "", ylab ="Energy sub metering")
lines(a$Date, a$Sub_metering_1)
lines(a$Date, a$Sub_metering_2, col = "red")
lines(a$Date, a$Sub_metering_3, col = "blue")
legend("topright", lty = "solid", col = c("black","red", "blue"), 
               legend = names(a)[7:9])
dev.off()

        Sys.setlocale() ## changing to your local settings again