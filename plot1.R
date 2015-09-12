#load file
powerraw <- read.table("household_power_consumption.txt", stringsAsFactors=FALSE, header=TRUE, sep=";")

#remove unwanted dates
rmlines <- which(powerraw$Date != "1/2/2007" & powerraw$Date != "2/2/2007")
powerdata <- powerraw[(-1 * rmlines),]

#convert columns to appropriate formats
#date and time columns to date and time
powerdata$datetime <- paste(powerdata$Date, powerdata$Time)
powerdata$datetime <- as.POSIXct(powerdata$datetime, format="%d/%m/%Y %H:%M:%S")

#all other columns to numeric
powerdata[,3:9] <- as.numeric(unlist(powerdata[,3:9]))

#plot
hist(powerdata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

#save as png file
dev.copy(png, "plot1.png")
dev.off()