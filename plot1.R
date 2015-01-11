#Load File into dataset data
file <- "household_power_consumption.txt"
data <- read.table(file, sep=";", header=TRUE, na.strings="?")

#subset data 
data <- data[((data$Date == "1/2/2007") | (data$Date == "2/2/2007")),]

#convert Date and Time column 
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

#make plot1
png('plot2.png', bg="transparent", width=480, height=480)
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()
