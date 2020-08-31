
setwd("./Coursera/Exploratory")

## Read the data

data <- read.csv("household_power_consumption.txt", 
                 header = T, sep = ";", na.strings = "?", 
                 nrows = 2075259, check.names = F, 
                 stringsAsFactors = F, comment.char = "", 
                 quote = '\"')

## Subset data for specified dates

data1 <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
data1$Date <- as.Date(data1$Date, format = "%d/%m/%Y")
date_time <- paste(as.Date(data1$Date), data1$Time)
data1$Date_time <- as.POSIXct(date_time)

## Plot 3

png("plot3.png", width = 480, height = 480)

with(data1, 
        {plot(Sub_metering_1 ~ Date_time, 
                 ylab = "Energy sub-metering (watt-hour)", xlab = "", 
                 cex.lab = 0.8, cex.axis = 0.8, type = "l")
                lines(Sub_metering_2 ~ Date_time, col = "red")
                lines(Sub_metering_3 ~ Date_time, col = "blue")
        }
     )
legend("topright", lty = 1, lwd = 2,
       col = c("black", "red", "blue"),
       legend = c("Sub-metering 1", "Sub-metering 2", "Sub-metering 3"),
       cex = 0.75)

## Please note that my environment is in Spanish, 
## therefore, the day names are "jue" by "Thu", 
## "vie" by "Fri" and "sáb" by "Sat" for the labels.

dev.off()
