# plot4

# Read file
      e_table <- read.csv("household_power_consumption.txt", sep=";", colClasses = "character")

# Create file containing data only from the dates of interest
      feb_table <- e_table[e_table$Date=="1/2/2007" | e_table$Date=="2/2/2007",]

# Coerce Global_reactive_power column as numeric      
      feb_table[,4] <- as.numeric(feb_table[,4])    

# Coerce Voltage column as numeric      
      feb_table[,5] <- as.numeric(feb_table[,5])          

# Coerce "Sub_metering_x" columns as numeric      
      feb_table[,7] <- as.numeric(feb_table[,7])    
      feb_table[,8] <- as.numeric(feb_table[,8]) 
      feb_table[,9] <- as.numeric(feb_table[,9]) 
      
# Create a time scale for plotting      
      timescale <- strptime(paste(feb_table[,1], feb_table[,2]), "%d/%m/%Y %H:%M:%S")

# Open PNG file
      png(filename = "plot4.png",
          width = 480, 
          height = 480, 
          units = "px")
      
      # Define a 2 x 2 plot template (fill in by row), and set outer and plot margins
            par(mfrow=c(2,2), oma=c(1,1,1,1), mar=c(5,4,3,2))
            
      # Plot scatterplot for Global Active Power
            plot(timescale, feb_table$Global_active_power, 
                 type="l", 
                 xlab="",
                 ylab="Global Active Power")
            
      # Plot scatterplot for Voltage
            plot(timescale, feb_table$Voltage, 
                 type="l", 
                 xlab="datetime",
                 ylab="Voltage")
            
      # Plot scatterplot for Sub_meterings 1, 2, & 3
            # Plot Sub_metering_1
                  plot(timescale, feb_table$Sub_metering_1, 
                       type="l", 
                       xlab="",
                       ylab="Energy sub metering")
            
            # Add scatterplot lines for Sub_metering_2 & # Sub_metering_3
                  lines(timescale, feb_table$Sub_metering_2, col="red")
                  lines(timescale, feb_table$Sub_metering_3, col="purple3")
            
            # Add legend
                  legend("topright", lty = 1, col=c("black", "red", "purple"), 
                         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                         bty="n",
                         cex=0.9)
            
      # Plot scatterplot for Global Reactive Power
            plot(timescale, feb_table$Global_reactive_power, 
                 type="l", 
                 xlab="datetime",
                 ylab="Global_reactive_power")
      
# Close PNG file
      dev.off()
      