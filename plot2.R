## reading the data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character")

## converting the Date variable to Date class
data$Date <- as.Date(data$Date, "%d/%m/%Y")

## subsetting the data from the dates 2007-02-01 and 2007-02-02.
data1 <- subset(data, (data$Date == "2007-02-01" | data$Date == "2007-02-02"))

## converting the Time variable to Time class
data1$Time <- paste(data1$Date, data1$Time)
data1$Time <- strptime(data1$Time, "%Y-%m-%d %H:%M:%S")

## converting the power consumption data to numeric class
data1$Global_active_power <- as.numeric(data1$Global_active_power)

## making plot to a PNG file
png(file = "plot2.png")
with(data1, plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()