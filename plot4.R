##  Plotting Assignment 1 for Exploratory Data Analysis
##  Plot 4

##  Get the data from file
alldata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

##  Create a combined Date and Time column
alldata$DateTime <- dmy(alldata$Date) + hms(alldata$Time)

##  Extract only the data for 1 Feb 2007 and 2 Feb 2007
alldata <- subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")

##  Convert the required columns from character to number
alldata$Global_active_power <- as.numeric(alldata$Global_active_power)
alldata$Voltage <- as.numeric(alldata$Voltage)
alldata$Sub_metering_1 <- as.numeric(alldata$Sub_metering_1)
alldata$Sub_metering_2 <- as.numeric(alldata$Sub_metering_2)
alldata$Sub_metering_3 <- as.numeric(alldata$Sub_metering_3)
alldata$Global_reactive_power <- as.numeric(alldata$Global_reactive_power)

##  Set up the device and plot area
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

##  Plot graph 1
plot(alldata$DateTime, alldata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

##  Plot graph 2
plot(alldata$DateTime, alldata$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

##  Plot graph 3
plot(alldata$DateTime, alldata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(alldata$DateTime, alldata$Sub_metering_2, col = "red")
lines(alldata$DateTime, alldata$Sub_metering_3, col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

##  Plot graph 4
plot(alldata$DateTime, alldata$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()