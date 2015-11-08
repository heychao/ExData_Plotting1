# plot2

# Read file
      e_table <- read.csv("household_power_consumption.txt", sep=";", colClasses = "character")

# Create file containing data only from the dates of interest
      feb_table <- e_table[e_table$Date=="1/2/2007" | e_table$Date=="2/2/2007",]

# Coerce "Global_active_power" column as numeric      
      feb_table[,3] <- as.numeric(feb_table[,3])    

# Create a POSIXlt time vector for plotting      
      timescale <- strptime(paste(feb_table[,1], feb_table[,2]), "%d/%m/%Y %H:%M:%S")

# Open PNG file
      png(filename = "plot2.png",
          width = 480, 
          height = 480, 
          units = "px")

      # Plot scatterplot
            plot(timescale, feb_table$Global_active_power, 
                 type="l", 
                 xlab="",
                 ylab="Global Active Power (kilowatts)")

# Close PNG file
      dev.off()

