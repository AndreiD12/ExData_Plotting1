data <- read.csv(file = "C:\\Users\\Andrei\\Downloads\\exdata-data-household_power_consumption\\household_power_consumption.txt", header = TRUE,
                sep = ";")

data_rest <- data[(as.Date(data$Date) >= as.Date("1/2/2007")) & (as.Date(data$Date) <= as.Date("2/2/2007")),]

data_rest <- data_rest[(data_rest$Date == "2/1/2007") | (data_rest$Date=="2/2/2007"),]

rm(data)

plot1_data <- data_rest$Global_active_power[as.character(data_rest$Global_active_power) != "?"]

hist(as.double(as.character(plot1_data)), col = "red", main = "Global Active Power",  xlim = c(0,6),xlab = "Global Active Power (kilowatts)", ylim = c(0,1200))

dev.copy(png, "plot1.png", height = 480, width = 480)

dev.off()



