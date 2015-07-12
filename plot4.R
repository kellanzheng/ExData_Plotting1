### Load Data (Common to All Four Plots)

setwd("~/Coursera/data_science/exploratory_data/")
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
data$DateRight <- as.Date(data$Date, format = "%d/%m/%Y")
data$TimeRight <- strptime(paste(data$Date, data$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
dataSubset <- subset(data,data$DateRight == as.Date("2007-02-01") | data$DateRight == as.Date("2007-02-02"))

setwd("~/Coursera/data_science/exploratory_data/ExData_Plotting1")

### Create Plot 4
png(filename = "plot4.png")
par(mfrow=c(2,2))

#4A
plot(dataSubset$TimeRight,dataSubset$Global_active_power,type = "n", ylab = "Global Active Power", xlab = "")
lines(dataSubset$TimeRight,dataSubset$Global_active_power)

#4B
plot(dataSubset$TimeRight,dataSubset$Voltage,type = "n", ylab = "Voltage", xlab = "datetime")
lines(dataSubset$TimeRight,dataSubset$Voltage, ylab = "Voltage")

#4C
plot(dataSubset$TimeRight,dataSubset$Sub_metering_1,type = "n", ylab = "Energy sub metering", xlab = "")
lines(dataSubset$TimeRight,dataSubset$Sub_metering_1)
lines(dataSubset$TimeRight,dataSubset$Sub_metering_2, col = "red")
lines(dataSubset$TimeRight,dataSubset$Sub_metering_3, col = "blue")
legend("topright",lwd=1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

#4D
plot(dataSubset$TimeRight,dataSubset$Global_reactive_power,type = "n", ylab = "Global_reactive_power", xlab = "datetime")
lines(dataSubset$TimeRight,dataSubset$Global_reactive_power, ylab = "Voltage", lwd=0.5)

dev.off()
