# Download and unzip data file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="household.zip")
unzip("household.zip")

# Read the data and subset the first two months
household <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
household <- household[household$Date=="1/2/2007"|household$Date=="2/2/2007",]
household$DateTime <- paste(household$Date,household$Time)
household$DateTime <- strptime(household$DateTime,"%d/%m/%Y %H:%M:%S")

# Open graphic device
png(file = "plot4.png")

# Make plot
par(mfrow = c(2, 2),mar=c(4,4,1,1))
#axis(side=1,tck=-0.001)

# Sub-plot 1
plot(household$DateTime,household$Global_active_power,type="l",xlab="",
    ylab="Global Active Power")

# Sub-plot 2
plot(household$DateTime,household$Voltage,type="l",xlab="datetime",ylab="Voltage")

# Sub-plot 3
plot(household$DateTime, household$Sub_metering_1,type="n",xlab="",
    ylab="Energy sub metering")
points(household$DateTime,household$Sub_metering_1,type="l")
points(household$DateTime,household$Sub_metering_2,type="l",col="red")
points(household$DateTime,household$Sub_metering_3,type="l",col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    #,y.intersp=0.5, cex=0.9,seg.len=1, bty="n")

# Sub-plot 4
plot(household$DateTime,household$Global_reactive_power,type="l",xlab="datetime",ylab="Global_Reactive_Power")

# Close graphic device
dev.off()
