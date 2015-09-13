## Created for Coursera :: Exploratory Data Analysis::
## September 2015
##
## *** From instructions ***
## "We will only be using data from the dates 2007-02-01 and 2007-02-02. 
## One alternative is to read the data from just those dates 
## rather than reading in the entire dataset and subsetting to those dates."
## 
## ** So to create a smaller file with only the dates needed:
## 1) download entire file
## 2) at command line, grep ^[1-2]\/2\/2007 [name of entire data file].txt > subset.txt
## 3) ensure file "subset.txt" is in working directory

powerData <- read.table("subset.txt",header=FALSE,sep=";",dec=".",na.strings=c("?",""))
names(powerData) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")
powerData$Time <- strptime(paste(powerData$Date,powerData$Time),"%Y-%m-%d%T")

png(filename="plot4.png",width=480,heigh=480,bg = "transparent")
par(mfcol=c(2,2))
## print upper left plot
plot(powerData$Time,powerData$Global_active_power,type="l", xlab = "", ylab="Global Active Power (kilowatts)")

## print lower left plot
plot(powerData$Time,powerData$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
points(powerData$Time,powerData$Sub_metering_1,type="l",col="black")
points(powerData$Time,powerData$Sub_metering_2,type="l",col="red")
points(powerData$Time,powerData$Sub_metering_3,type="l",col="blue")
legend("topright", pch = c("-","-","-"), col= c("black","blue","red"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## print upper right plot
plot(powerData$Time,powerData$Voltage,type="l", xlab = "datetime", ylab="Voltage")

## print lower right plot
plot(powerData$Time,powerData$Global_reactive_power,type="l", xlab = "datetime", ylab="Global Reactive Power")

dev.off()
rm(powerData)