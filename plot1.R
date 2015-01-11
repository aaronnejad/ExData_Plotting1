#First need to export the textfile data into an Excel cvs file called power.csv. I then subsetted the correct columns and rows.I actually subsetted using Excel methods. 
#Here I saved the text file in /Desktop/Coursera/Explore

#I open Excel and then open the textfile from Excel, I comma delimit and then the Excel csv file has all the columns correctly allinged (if I delimit it using the Excel tools)
#I save the Excel csv file as    "power.csv"
#For the first two plots I converted the files direct into csv as they have fewer columns. For plot 3 and 4 I use 
#read.csv.sql

p<-read.csv("power.csv",header=TRUE)

#Now plot the data 
hist(p$Global_active_power,col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="")
title(main = "Global Active Power")

#Now save it to a png file 
dev.copy(png,'myplot4.png', width=480, height=480)
dev.off()
