#getting filepath

file <- "data/ExploringData/household_power_consumption.txt"

#loading text file with seperator ;
data <- read.csv(file, sep=";" , na.strings="?", nrows=2075259, header=TRUE)

#converting date column
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#subsetting data
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#converting date+time
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#getting Plot 4

op <- par(mfrow=c(2,2))

with(data,{
plot(data$Global_active_power~data$Datetime, ylab="Global Active Power (kilowatts)", type="l", xlab="")
plot(data$Voltage~data$Datetime, ylab="Voltage", type="l", xlab="datetime")
plot(data$Sub_metering_1~data$Datetime, 
     type="l", 
     ylab="Energy sub-metering", 
     xlab="", 
     col="Black")
lines(data$Sub_metering_2~data$Datetime, col="Red")
lines(data$Sub_metering_3~data$Datetime, col="Blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=2, bty="n")
plot(data$Global_reactive_power~data$Datetime, ylab="Global_reactive_power", type="l", xlab="datetime")
})


#saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
