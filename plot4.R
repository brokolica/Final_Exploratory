plot4 <- function(){
  
  data <- read.csv2("household_power_consumption.txt",
                    dec=".",
                    na.strings="?",
                    colClasses=c(rep("character", 2), rep("numeric", 7)))
  
  data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
  
  dateTime  <- as.POSIXlt(paste(as.Date(data$Date, "%d/%m/%Y"), data$Time, sep=" "))
  
  par(mfrow = c(2, 2))
  
  with(data, {
    plot(dateTime, data$Global_active_power,
         type="l",
         xlab="",
         ylab="Global Active Power (kilowatts)")
    plot(dateTime, data$Voltage,
         type="l",
         xlab="datetime",
         ylab="Voltage")
    plot(dateTime, data$Sub_metering_1,
         type="n",
         xlab="",
         ylab="Energy sub metering")
    lines(dateTime, data$Sub_metering_1, col="black")
    lines(dateTime, data$Sub_metering_2, col="red")
    lines(dateTime, data$Sub_metering_3, col="blue")
    legend("topright",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col=c("black","red","blue"),
           bty="n",
           lty=c(1,1,1))
    plot(dateTime, data$Global_reactive_power,
         type="l",
         xlab="datetime",
         ylab="Global_reactive_power")
  })
  
  
  dev.copy(png, file="plot4.png", width=480, height=480)
  dev.off()
  
}