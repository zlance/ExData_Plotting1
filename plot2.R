#Download and read the data in.

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",dest="proj1.zip")
unzip("proj1.zip")

data <- read.table("household_power_consumption.txt", header = TRUE , sep = ";",na.strings = "?")

dat  <- data[which( as.Date(data$Date,format="%d/%m/%Y")== as.Date("2007-02-01",format="%Y-%m-%d") | 
                    as.Date(data$Date,format="%d/%m/%Y")== as.Date("2007-02-02",format="%Y-%m-%d") ) ,]

as.Date(dat$Date)

#plot2

dt <- as.POSIXct(paste(dat$Date,dat$Time) ,format="%d/%m/%Y %H:%M:%S")

with ( dat, plot(dt ,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)") )

