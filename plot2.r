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

#getting Plot 2
plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
