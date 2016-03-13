data <- read.csv(file = "C:\\Users\\Andrei\\Downloads\\exdata-data-household_power_consumption\\household_power_consumption.txt", header = TRUE,
                 sep = ";")

data_rest <- data[(as.Date(data$Date) >= as.Date("2/1/2007")) & (as.Date(data$Date) <= as.Date("2/2/2007")),]

data_rest <- data_rest[(as.character(data_rest$Date) == "2/1/2007") | (as.character(data_rest$Date)=="2/2/2007"),]

data_rest <- data_rest[as.character(data_rest$Global_active_power) != "?",]

global_act <- as.double(as.character(data_rest$Global_active_power))

data_rest$DateTime <- paste0(as.character(data_rest$Date), as.character(data_rest$Time))


plot(as.POSIXct(data_rest$DateTime, format="%m/%d/%Y%H:%M:%S"), as.double(as.character(data_rest$Sub_metering_1)), xaxt = "n", type = "n", ylab = "Energy sub metering", xlab="", ylim=c(0,50))

lines(as.POSIXct(data_rest$DateTime, format="%m/%d/%Y%H:%M:%S"), as.double(as.character(data_rest$Sub_metering_1)), col = "black",lwd=1)
lines(as.POSIXct(data_rest$DateTime, format="%m/%d/%Y%H:%M:%S"), as.double(as.character(data_rest$Sub_metering_2)), col = "red", lwd=1)
lines(as.POSIXct(data_rest$DateTime, format="%m/%d/%Y%H:%M:%S"), as.double(as.character(data_rest$Sub_metering_3)), col = "blue", lwd=1)
wd <- c("Fri", "Sat")

axis(1, at=unique(as.POSIXct(data_rest$DateTime, format="%d/%m/%Y")), labels=wd, las=2)
legend("topright", lty=c(1,1), col=c("black", "red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


dev.copy(png, "plot3.png", height = 480, width = 480)

dev.off()

