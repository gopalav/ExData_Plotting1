# Column names
names<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Read data related to 1/2/2007 and 2/2/2007
# When we are reading intermediate rows, we will miss the header, so manually add the column names
powerData<-read.table("UCIPower/household_power_consumption.txt",header=TRUE,sep=";",skip=66636,nrows=2880, col.names = names)

# Create a histogram for active power with required x-axis label and graph label
with(powerData, hist(Global_active_power,xlab="Global Active Power (kilowatts)",col="Red",main="Global Active Power"))

# Copy the histogram to png file
dev.copy(png, file="plot1.png")

# Close the png device
dev.off()
