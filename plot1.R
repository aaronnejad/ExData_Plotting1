#First need to export the textfile data into an Excel cvs file called power.csv. I then subsetted the correct columns and rows.I actually subsetted using Excel methods. 

p<-read.csv("power.csv",header=TRUE)

#Now plot the data 
hist(p$Global_active_power,col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="")
title(main = "Global Active Power")

#Now save it to a png file 
dev.copy(png,'myplot4.png', width=480, height=480)
dev.off()