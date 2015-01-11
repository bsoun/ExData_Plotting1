#Load File into dataset data
file <- "household_power_consumption.txt"
data <- read.table(file, sep=";", header=TRUE, na.strings="?")

#subset data 
data <- data[((data$Date == "1/2/2007") | (data$Date == "2/2/2007")),]

#convert Date and Time column 
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

#set english locale to get weekdays in english
Sys.setlocale("LC_ALL", "en_US")

#make plot2
png('plot2.png', bg="transparent", width=480, height=480)
plot(data$Date,data$Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab="")

dev.off()
