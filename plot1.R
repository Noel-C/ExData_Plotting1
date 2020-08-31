
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

## Plot 1. Histogram

png("plot1.png", width = 480, height = 480)

hist(data1$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
     col = "Red", cex.lab = 0.8, cex.axis = 0.8, cex.main = 1)

dev.off()




