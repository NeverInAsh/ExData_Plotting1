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
png("plot4.png", width=480, height=480)

#SEtting facets/panels in R base plotting system
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(dataf, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.off()
