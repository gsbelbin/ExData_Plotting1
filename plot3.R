##  Plotting Assignment 1 for Exploratory Data Analysis
##  Plot 3

##  Get the data from file
alldata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

##  Create a combined Date and Time column
alldata$DateTime <- dmy(alldata$Date) + hms(alldata$Time)

##  Extract only the data for 1 Feb 2007 and 2 Feb 2007
alldata <- subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")

##  Convert the required columns from character to number
alldata$Sub_metering_1 <- as.numeric(alldata$Sub_metering_1)
alldata$Sub_metering_2 <- as.numeric(alldata$Sub_metering_2)
alldata$Sub_metering_3 <- as.numeric(alldata$Sub_metering_3)

##  Plot the graph
png("plot3.png", width = 480, height = 480)
plot(alldata$DateTime, alldata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(alldata$DateTime, alldata$Sub_metering_2, col = "red")
lines(alldata$DateTime, alldata$Sub_metering_3, col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()