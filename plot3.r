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

#getting Plot 3
with(data, {
        plot(data$Sub_metering_1~data$Datetime, 
             type="l", 
             ylab="Energy sub-metering", 
             xlab="", 
             col="Black")
        lines(data$Sub_metering_2~data$Datetime, col="Red")
        lines(data$Sub_metering_3~data$Datetime, col="Blue")
})
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=2)


#saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()