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

png(filename="plot2.png",width=480,heigh=480,bg = "transparent")
plot(powerData$Time,powerData$Global_active_power,type="l", xlab = "", ylab="Global Active Power (kilowatts)")
dev.off()
rm(powerData)