##  Plotting Assignment 1 for Exploratory Data Analysis
##  Plot 1

##  Get the data from file
alldata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

##  Create a combined Date and Time column
alldata$DateTime <- dmy(alldata$Date) + hms(alldata$Time)

##  Extract only the data for 1 Feb 2007 and 2 Feb 2007
alldata <- subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")

##  Convert the required column from character to number
alldata$Global_active_power <- as.numeric(alldata$Global_active_power)

##  plot the graph
png("plot1.png", width = 480, height = 480)
hist(alldata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()