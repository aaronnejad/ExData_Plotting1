
# Here we will first convert the text file into a csv file and name it power.csv. I already subsetted the data using Excel methods. 
p<-read.csv("power.csv", header = TRUE)
 
# This is to make sure the data is correct
head(p)

# Below we will paste together the date and time column so that it reads it as one column
p$datetime<-paste(p$Date, p$Time)
 head(p$datetime)


#Formating the datetime column
 p$posixDate <- strptime(p$datetime, "%d/%m/%Y %H:%M:%S")
 
 
# Plot chart with correct labels
 plot(p$posixDate,p$Global_active_power,type="l", ylab="Global Active Power (killowatts)", xlab= "")
 
#conert to png file 
dev.copy(png, file="plot2.png", height = 480, width =480)

 dev.off()
