# Column names
names<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Read data related to 1/2/2007 and 2/2/2007
# When we are reading intermediate rows, we will miss the header, so manually add the column names
powerData<-read.table("UCIPower/household_power_consumption.txt",header=TRUE,sep=";",skip=66636,nrows=2880, col.names = names, na.strings = "?")

# X axis is for the date time.  Create a new variable from date and time
dateTime <- strptime(paste(powerData$Date, powerData$Time), "%d/%m/%Y %H:%M:%S")

# Create a plot for active power on y axis and date time on x axis
with(powerData, plot(dateTime, Global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab=""))

# Copy the histogram to png file
dev.copy(png, file="plot2.png")

# Close the png device
dev.off()
