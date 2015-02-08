#First need to export the textfile data into an Excel cvs file called power.csv. I then subsetted the correct columns and rows.I actually subsetted using Excel methods. 
#Here I saved the text file in /Desktop/Coursera/Explore

#I open Excel and then open the textfile from Excel, I comma delimit and then the Excel csv file has all the columns correctly allinged (if I delimit it using the Excel tools)
#I save the Excel csv file as    "power.csv"



# read the data into a variable named 'p' using read csv and sql function within it. 
p <- read.csv.sql("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'")
date <- paste(p$Date, p$Time)

# format the date
newdate <- strptime(date, "%d/%m/%Y %H:%M:%S")
#Date_Time<-newdate
Date_Time=newdate
#columnbinding two columns
p <- cbind(Date_Time, p)


#Now plot the data 
hist(p$Global_active_power,col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="")
title(main = "Global Active Power")

#Now save it to a png file 
dev.copy(png,'myplot4.png', width=480, height=480)
dev.off()
