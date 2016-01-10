setwd("C:/Users/APC/Desktop/DE1") 
library(datasets)

base <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses=c("character", "character", rep("numeric",7)), na.strings = "?")

base$Time <- strptime(paste(base$Date, base$Time), "%d/%m/%Y %H:%M:%S")
base$Date <- as.Date(base$Date, "%d/%m/%Y")
date_subset <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")

graphs_data <- subset(base, Date %in% date_subset)

par(mfrow=c(2,2))	
plot(graphs_data$Time, graphs_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(graphs_data$Time, graphs_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(graphs_data$Time, graphs_data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(graphs_data$Time, graphs_data$Sub_metering_2, type="l", col="red")
lines(graphs_data$Time, graphs_data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"),cex = 0.75)
plot(graphs_data$Time, graphs_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png,file="plot4.png", width=480,height=480)
dev.off()



