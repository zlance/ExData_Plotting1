#Download and read the data in.

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",dest="proj1.zip")
unzip("proj1.zip")

data <- read.table("household_power_consumption.txt", header = TRUE , sep = ";",na.strings = "?")

dat  <- data[which( as.Date(data$Date,format="%d/%m/%Y")== as.Date("2007-02-01",format="%Y-%m-%d") | 
                    as.Date(data$Date,format="%d/%m/%Y")== as.Date("2007-02-02",format="%Y-%m-%d") ) ,]

as.Date(dat$Date)

#plot3

dt <- as.POSIXct(paste(dat$Date,dat$Time) ,format="%d/%m/%Y %H:%M:%S")

with ( dat, {
    plot(dt ,Sub_metering_1,type="l",ylab="Energy Sub Metering",xlab="") 
    lines(dt ,Sub_metering_2,type="l",col="red") 
    lines(dt ,Sub_metering_3,type="l",col="blue")  
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),col=c("black","red","blue"))
})
