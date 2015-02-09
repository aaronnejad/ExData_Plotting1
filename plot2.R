

#In folder Desktop/Coursera/Explore should find a csv file called "power.csv"
# as explained in previous R file. Subsetting couldve been done using R's subsetting methods however for this simple
# section where only 2 variables are used I used Excel Csv's and sql subsetting methods. 

p <- read.csv.sql("household_power_consumption.txt", header = TRUE, sep = ";", 
colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), 
sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'")

 
# This is to make sure the data is correct
head(p)

# Below we will paste together the date and time column so that it reads it as one column
p$datetime<-paste(p$Date, p$Time)
 head(p$datetime)


#Formating the datetime column
 p$posixDate <- strptime(p$datetime, "%d/%m/%Y %H:%M:%S")
 
 
# Plot chart with correct labels
 plot(p$posixDate,p$Global_active_power,type="l", ylab="Global Active Power (killowatts)", xlab= "")
 
#connect to png file 
dev.copy(png, file="plot2.png", height = 480, width =480)

 dev.off()
