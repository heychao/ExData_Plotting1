# plot3

# Read file
      e_table <- read.csv("household_power_consumption.txt", sep=";", colClasses = "character")

# Create file containing data only from the dates of interest
      feb_table <- e_table[e_table$Date=="1/2/2007" | e_table$Date=="2/2/2007",]

# Coerce "Sub_metering_x" columnx as numeric      
      feb_table[,7] <- as.numeric(feb_table[,7])    
      feb_table[,8] <- as.numeric(feb_table[,8]) 
      feb_table[,9] <- as.numeric(feb_table[,9]) 
      
# Create a time scale for plotting      
      timescale <- strptime(paste(feb_table[,1], feb_table[,2]), "%d/%m/%Y %H:%M:%S")

# Open PNG file
      png(filename = "plot3.png",
          width = 480, 
          height = 480, 
          units = "px")

      # Plot scatterplot for Sub_metering_1
            plot(timescale, feb_table$Sub_metering_1, 
                 type="l", 
                 xlab="",
                 ylab="Energy sub metering")
            
      # Add scatterplot lines for Sub_metering_2 & # Sub_metering_3
            lines(timescale, feb_table$Sub_metering_2, col="red")
            lines(timescale, feb_table$Sub_metering_3, col="purple3")
     
      # Add legend
            legend("topright", lty = 1, col=c("black", "red", "purple"), 
                   legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
            
# Close PNG file
      dev.off()

