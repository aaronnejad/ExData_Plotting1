# Assignment 1 Exploratory Data Analysis, Plot4
# set working directory to "C:Desktop/Coursera/Explore"

# install correct sql packages if they have not already been installed
#install.packages("sqldf")
#library("sqldf")


# read in data filtered by specific dates combining data and time columns.
# I used sql as this was the method suggested in assignement but one couldve also used R's subsett method to pick the appropriate columns.

p <- read.csv.sql("household_power_consumption.txt", sep = ";",header =TRUE, colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'")
date <- paste(p$Date, p$Time)
newdate <- strptime(date, "%d/%m/%Y %H:%M:%S")
date=newdate
p <- cbind(date, p)


# open PNG graphics device
png("plot4.png", width=480, height=480)

# align plots by column
par(mfcol=c(2,2), cex=1.0)



# 1st Subplot
with(p, plot(Global_active_power ~ date, type="n", xlab="", ylab="Global Active Power"))
with(p, lines(Global_active_power ~ date, type="l"))

# 2nd subplot
with(p, plot(Sub_metering_1 ~ date, type="n", xlab="", ylab="Energy sub metering"))
with(p, lines(Sub_metering_1 ~ date, type="l", col="black"))
with(p, lines(Sub_metering_2 ~ date, type="l", col="red"))
with(p, lines(Sub_metering_3 ~ date, type="l", col="blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col=c("black", "red", "blue"), bty="n")

# 3rd subplot
with(p, plot(Voltage ~ date, type="n", xlab="datetime", ylab="Voltage"))
with(p, lines(Voltage ~ date, type="l"))

#4th subplot
with(p, plot(Global_reactive_power ~ date, type="n", xlab="datetime", ylab="Global_reactive_power"))
with(p, lines(Global_reactive_power ~ date, type="l"))

# closing graphics device
dev.off()
