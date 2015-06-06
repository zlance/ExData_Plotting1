#Download and read the data in.

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",dest="proj1.zip")
unzip("proj1.zip")

data <- read.table("household_power_consumption.txt", header = TRUE , sep = ";",na.strings = "?")

dat  <- data[which( as.Date(data$Date,format="%d/%m/%Y")== as.Date("2007-02-01",format="%Y-%m-%d") | 
                    as.Date(data$Date,format="%d/%m/%Y")== as.Date("2007-02-02",format="%Y-%m-%d") ) ,]

as.Date(dat$Date)

#plot1

with(dat,hist(Global_active_power,col="red",xlab="Global Active Power (kilowatts)", ylab="Frequency",main="Global Active Power"))
