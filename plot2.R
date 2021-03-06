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
png("plot2.png", width=480, height=480)

#Using Base Plotting System of R, hist automatically handles NA
plot(Global_active_power ~ Datetime,data = dataf,type = "l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.off()