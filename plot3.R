# get all data
allData <- read.csv("Data/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")

# format DateTime colum
allData$DateTime <- as.POSIXct(paste(allData$Date, allData$Time), format="%d/%m/%Y %H:%M:%S")

# use only specified range
data <- subset(allData, subset=(DateTime >= as.POSIXct("2007-02-01") & DateTime < as.POSIXct("2007-02-03")))

# plot to file
with(data, {
  plot(Sub_metering_1 ~ DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2 ~ DateTime, col='Red')
  lines(Sub_metering_3 ~ DateTime, col='Blue')
  })
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub 1", "Sub 2", "Sub 3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

# free memory
rm(allData)
rm(data)