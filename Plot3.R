#Plot3

# if you havent installed sqldf uncomment below
#install.packages("sqldf")
#library("sqldf")
# please note that in this file I didnt subsett the data in Excel but rather used R to select the appropriate columns using SQL. This is due to the more complicated
#nature of the file.


p <- read.csv.sql("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'")
date <- paste(p$Date, p$Time)
newdate <- strptime(date, "%d/%m/%Y %H:%M:%S")
#Date_Time<-newdate
Date_Time=newdate
#columnbinding two columns
p <- cbind(Date_Time, p)


# open PNG graphics device
png("plot3.png", width=480, height=480)

# create xy plot of data
with(p, plot(Sub_metering_1 ~ Date_Time, type="n", xlab="", ylab="Energy sub metering"))
with(p, lines(Sub_metering_1 ~ Date_Time, type="l", col="black"))
with(p, lines(Sub_metering_2 ~ Date_Time, type="l", col="red"))
with(p, lines(Sub_metering_3 ~ Date_Time, type="l", col="blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),pch=NA, cex=1, lty = c(1,1,1), col=c("black", "blue", "red"))

# close off graphics device
dev.off()
