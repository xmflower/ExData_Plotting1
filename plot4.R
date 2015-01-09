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
data1$Global_reactive_power <- as.numeric(data1$Global_reactive_power)
data1$Voltage <- as.numeric(data1$Voltage)
data1$Sub_metering_1 <- as.numeric(data1$Sub_metering_1)
data1$Sub_metering_2 <- as.numeric(data1$Sub_metering_2)
data1$Sub_metering_3 <- as.numeric(data1$Sub_metering_3)

## making plot to a PNG file
png(file = "plot4.png")
par(mfrow = c(2,2))
with(data1, {
    plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
    plot(Time, Voltage, type = "l", xlab = "datetime")
    plot(Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(Time, Sub_metering_2, col = "red")
    lines(Time, Sub_metering_3, col = "blue")
    legend("topright", lty = 1, bty = "n", cex = 0.9, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Time, Global_reactive_power, type = "l", xlab = "datetime")
})    
dev.off()