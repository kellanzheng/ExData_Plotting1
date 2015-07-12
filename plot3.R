### Load Data (Common to All Four Plots)

setwd("~/Coursera/data_science/exploratory_data/")
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
data$DateRight <- as.Date(data$Date, format = "%d/%m/%Y")
data$TimeRight <- strptime(paste(data$Date, data$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
dataSubset <- subset(data,data$DateRight == as.Date("2007-02-01") | data$DateRight == as.Date("2007-02-02"))

setwd("~/Coursera/data_science/exploratory_data/ExData_Plotting1")

### Create Plot 3

png(filename = "plot3.png")
plot(dataSubset$TimeRight,dataSubset$Sub_metering_1,type = "n", ylab = "Energy sub metering", xlab = "")
lines(dataSubset$TimeRight,dataSubset$Sub_metering_1)
lines(dataSubset$TimeRight,dataSubset$Sub_metering_2, col = "red")
lines(dataSubset$TimeRight,dataSubset$Sub_metering_3, col = "blue")
legend("topright",lwd=1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
