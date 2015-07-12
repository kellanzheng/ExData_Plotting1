### Load Data (Common to All Four Plots)

setwd("~/Coursera/data_science/exploratory_data/")
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
data$DateRight <- as.Date(data$Date, format = "%d/%m/%Y")
data$TimeRight <- strptime(paste(data$Date, data$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
dataSubset <- subset(data,data$DateRight == as.Date("2007-02-01") | data$DateRight == as.Date("2007-02-02"))

setwd("~/Coursera/data_science/exploratory_data/ExData_Plotting1")

### Create Plot 1

setwd("~/Coursera/data_science/exploratory_data/ExData_Plotting1")
png(filename = "plot1.png")
hist(dataSubset$Global_active_power, col= "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
