# Download and unzip data file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="household.zip")
unzip("household.zip")

# Read the data and subset the first two months
household <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
household <- household[household$Date=="1/2/2007"|household$Date=="2/2/2007",]
household$DateTime <- paste(household$Date,household$Time)
household$DateTime <- strptime(household$DateTime,"%d/%m/%Y %H:%M:%S")

# Open graphic device
png(file = "plot3.png")
# Make plot
plot(household$DateTime, household$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
points(household$DateTime,household$Sub_metering_1,type="l")
points(household$DateTime,household$Sub_metering_2,type="l",col="red")
points(household$DateTime,household$Sub_metering_3,type="l",col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
	legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# Close graphic device
dev.off()
