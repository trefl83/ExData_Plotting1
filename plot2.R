#load data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
my_data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
rm(data)

#format date and time
my_data$datetime <- strptime(paste(my_data$Date, my_data$Time), format="%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME","en_US.UTF-8")

#plot
png(filename="plot2.png", width=480, height=480)
plot(my_data$datetime, my_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
