## Get full dataset
setwd("C:/Users/Sum/Desktop/Coursera Data Sciences/Exploratory Data Analysis/Week 1")
data_full <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subset of data between 1/2/2007 and 2/2/2007
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##Remove the full set as the filtering is done.
rm(data_full)

## Convert dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file in png format
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()