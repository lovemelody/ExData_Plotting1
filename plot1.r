#getting filepath

file <- "data/ExploringData/household_power_consumption.txt"

#loading text file with seperator ;
data <- read.csv(file, sep=";" , na.strings="?", nrows=2075259, header=TRUE)

#converting date column
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#subsetting data
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#getting Plot 1
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")



#saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
