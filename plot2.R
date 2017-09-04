# Download and unzip data file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="household.zip")
unzip("household.zip")

# Read the data and subset the first two months
household <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
household <- household[household$Date=="1/2/2007"|household$Date=="2/2/2007",]
household$DateTime <- paste(household$Date,household$Time)
household$DateTime <- strptime(household$DateTime,"%d/%m/%Y %H:%M:%S")

# Open graphic device
png(file = "plot2.png")
# Make plot
plot(household$DateTime,household$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
# Close graphic device
dev.off()
