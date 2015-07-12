# get all data
allData <- read.csv("Data/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")

# format DateTime colum
allData$DateTime <- as.POSIXct(paste(allData$Date, allData$Time), format="%d/%m/%Y %H:%M:%S")

# use only specified range
data <- subset(allData, subset=(DateTime >= as.POSIXct("2007-02-01") & DateTime < as.POSIXct("2007-02-03")))

# plot to file
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

# free memory
rm(allData)
rm(data)