## Getting full dataset
getwd()

power_data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")

## Subsetting the data
ss_data <- subset(power_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(power_data)

## Converting dates
datetime <- paste(as.Date(ss_data$Date), ss_data$Time)
ss_data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(ss_data$Global_active_power~ss_data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="Plot2.png", height=480, width=480)
dev.off()