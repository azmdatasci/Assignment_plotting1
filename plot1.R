# Download and unzip data file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="household.zip")
unzip("household.zip")

# Read the data and subset the first two months
household <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
household <- household[household$Date=="1/2/2007"|household$Date=="2/2/2007",]
household$Global_active_power <- as.numeric(household$Global_active_power)

# Open graphic device
png(file = "plot1.png")
# Make plot
hist(household$Global_active_power, col = "red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
# Close graphic device
dev.off()
