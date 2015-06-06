plot2 <- function(){
  
  data <- read.csv2("household_power_consumption.txt",
                    dec=".",
                    na.strings="?",
                    colClasses=c(rep("character", 2), rep("numeric", 7)))
  
  data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
  
  dateTime  <- as.POSIXlt(paste(as.Date(data$Date, "%d/%m/%Y"), data$Time, sep=" "))
  
  par(mfrow = c(1, 1))
  
  plot(dateTime, data$Global_active_power,
       type="l",
       xlab="",
       ylab="Global Active Power (kilowatts)")
  
  dev.copy(png, file="plot2.png", width=480, height=480)
  dev.off()
  
}