setwd("C:/Users/APC/Desktop/DE1") 
library(datasets)

base <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses=c("character", "character", rep("numeric",7)), na.strings = "?")

base$Time <- strptime(paste(base$Date, base$Time), "%d/%m/%Y %H:%M:%S")
base$Date <- as.Date(base$Date, "%d/%m/%Y")
date_subset <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")

graphs_data <- subset(base, Date %in% date_subset)

plot(graphs_data$Time, graphs_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png,file="plot2.png", width=480,height=480)
dev.off()
