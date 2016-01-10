setwd("C:/Users/APC/Desktop/DE1") 
library(datasets)

base <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

base$Date <- as.Date(as.character(base$Date),"%d/%m/%Y")
base$Time <- strptime(base$Time,"%H:%M:%S")

graphs_data <- subset(base, (base$Date==as.Date("2007-02-01") | base$Date==as.Date("2007-02-02")) )

hist(graphs_data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power(kilowatts)",ylab = "Frequency", xlim=c(0,6),ylim=c(0,1200))

dev.copy(png,file="plot1.png", width=480,height=480)
dev.off()
