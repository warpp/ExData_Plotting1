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

#plot
plot(powerdata$datetime, powerdata$Global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)")

#save as png
dev.copy(png, "plot2.png")
dev.off()