#load data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
my_data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
rm(data)

#format date and time
my_data$datetime <- strptime(paste(my_data$Date, my_data$Time), format="%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME","en_US.UTF-8")

#plot
png(filename="plot3.png", width=480, height=480)
plot(my_data$datetime, my_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(my_data$datetime, my_data$Sub_metering_2, type="l", col="red")
lines(my_data$datetime, my_data$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

