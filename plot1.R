plot1 <- function(){
  
  data <- read.csv2("household_power_consumption.txt",
                    dec=".",
                    na.strings="?",
                    colClasses=c(rep("character", 2), rep("numeric", 7)))
  
  data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
  
  par(mfrow = c(1, 1))
  
  hist(data$Global_active_power,
       main="Global Active Power",
       col="red",
       xlab="Global Active Power (kilowatts)")  
  
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()
  
}