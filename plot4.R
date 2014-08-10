# Column names
names<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Read data related to 1/2/2007 and 2/2/2007
# When we are reading intermediate rows, we will miss the header, so manually add the column names
powerData<-read.table("UCIPower/household_power_consumption.txt",header=TRUE,sep=";",skip=66636,nrows=2880, col.names = names, na.strings = "?")

# X axis is for the date time.  Create a new variable from date and time
dateTime <- strptime(paste(powerData$Date, powerData$Time), "%d/%m/%Y %H:%M:%S")

# Set the layout to 2x2 graphs
par(mfrow = c(2,2))

# Plot 1: Create a plot for global active power on y axis and date time on x axis
with(powerData, plot(dateTime, Global_active_power, type="l",ylab="Global Active Power", xlab=""))

# Plot 2: Create a plot for voltage on y axis and date time on x axis
plot(dateTime, powerData$Voltage, type="l",ylab="Voltage", xlab="datetime")

# Plot 3: Create a plot for multiple sub meterings on y axis and date time on x axis
plot(dateTime, powerData$Sub_metering_1, type="l",ylab="Energy sub metering", xlab="")

# Add another plot with sub metering 2
lines(dateTime,powerData$Sub_metering_2,col="red")

# Add another plot with sub metering 3
lines(dateTime,powerData$Sub_metering_3,col="blue")

# Add legend 
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red", "blue"), lwd=2, cex=0.5, lty=1, bty="n")

# Plot 4: Create a plot for global reactive power on y axis and date time on x axis
plot(dateTime, powerData$Global_reactive_power, type="l",ylab="Global_reactive_power", xlab="datetime")


# Copy the combined plot to png file
dev.copy(png, file="plot4.png")

# Close the png device
dev.off()
