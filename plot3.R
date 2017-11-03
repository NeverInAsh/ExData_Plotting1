setwd("C:\\Users\\aa16228\\Desktop\\Exploratory Data Analysis\\")
data <- read.csv("household_power_consumption.txt", sep = ";",na.strings="?")

#no need to convert to date object as string matching works just fine.
dataf <- subset(data, Date%in%c("1/2/2007","2/2/2007")) 

#For easy plotting we can now convert date to date object
dataf$Date <- as.Date(dataf$Date, format="%d/%m/%Y")


#Creating WeekDays
datetime <- paste(as.Date(dataf$Date), dataf$Time)
dataf$Datetime <- as.POSIXct(datetime)


#Setting graphical Device and graph name
png("plot3.png", width=480, height=480)

#Using Base Plotting System of R, hist automatically handles NA
with(dataf, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()