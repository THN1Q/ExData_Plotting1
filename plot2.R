# Script for Plot 2 examining household power usage over 01-02/02/2007
# Data from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# Please download and unzip in your working directory

require(lubridate) # Lubridate package is used for Date operations/conversion.

# Reading in data, subsetting and preparing Date variable for plotting
electrics <- read.csv2("household_power_consumption.txt", na.strings = "?", dec = ".",
                       colClasses = c("character", "character", "numeric", "numeric",
                                      "numeric", "numeric", "numeric", "numeric",
                                      "numeric"), nrows = 70000)
electrics <- electrics[electrics$Date == "1/2/2007" | electrics$Date == "2/2/2007", ]
row.names(electrics) <- NULL
electrics <- transform(electrics, Date = dmy_hms(paste(Date, Time)))

# Setting up transparency
par(bg = "transparent")

# Plotting on png device
png(file = "plot2.png", width = 480, height = 480, units = "px")
with(electrics, plot(x = Date, y = Global_active_power, type = "l", xlab = "",
                     ylab = "Global Active Power (kilowatts)"))
dev.off()