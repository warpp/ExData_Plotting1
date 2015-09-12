#load file
powerraw <- read.table("household_power_consumption.txt", stringsAsFactors=FALSE, header=TRUE, sep=";")

#remove unwanted dates
rmlines <- which(powerraw$Date != "1/2/2007" & powerraw$Date != "2/2/2007")
powerdata <- powerraw[(-1 * rmlines),]

#convert columns to appropriate formats

#combine date and time into one variable
powerdata$datetime <- paste(powerdata$Date, powerdata$Time)

#date and time convert to date and time 
powerdata$datetime <- as.POSIXct(powerdata$datetime, format="%d/%m/%Y %H:%M:%S")

#all other columns to numeric
powerdata[,3:9] <- as.numeric(unlist(powerdata[,3:9]))

png(filename="plot3.png")
with(powerdata, plot(powerdata$datetime, powerdata$Sub_metering_1, xlab="", ylab="Energy sub metering", type="n"))
lines(powerdata$datetime, powerdata$Sub_metering_1)
lines(powerdata$datetime, powerdata$Sub_metering_2,col="red")
lines(powerdata$datetime, powerdata$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


dev.off()