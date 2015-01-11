#Load File into dataset data
file <- "household_power_consumption.txt"
data <- read.table(file, sep=";", header=TRUE, na.strings="?")

#subset data 
data <- data[((data$Date == "1/2/2007") | (data$Date == "2/2/2007")),]

#convert Date and Time column 
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

#set english locale to get weekdays in english
Sys.setlocale("LC_ALL", "en_US")

#make plot4
png('plot4.png', bg="transparent", width=480, height=480)

#set layout 2x2
par(mfcol=c(2,2))

#make plot : top left
plot(data$Date,data$Global_active_power, type="l",ylab="Global Active Power",xlab="")

#make plot : bottom left
plot(data$Date,data$Sub_metering_1, type="l",ylab="Energy sub metering",xlab="")
lines(data$Date,data$Sub_metering_2, type="l", col="red")
lines(data$Date,data$Sub_metering_3, type="l", col="blue")
legend("topright", box.lwd=0, legend=names(data[7:9]), lty=1, col=c("black","red","blue"), cex=0.7)

#make plot : top right
plot(data$Date,data$Voltage, type="l",ylab="Voltage",xlab="datetime")

#make plot : bottom right
plot(data$Date,data$Global_reactive_power, type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()