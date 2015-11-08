# plot1

# Read file
      e_table <- read.csv("household_power_consumption.txt", sep=";", colClasses = "character")

# Create file containing data only from the dates of interest
      feb_table <- e_table[e_table$Date=="1/2/2007" | e_table$Date=="2/2/2007",]

# Coerce Global_active_power column as numeric      
      feb_table[,3] <- as.numeric(feb_table[,3])    

# Open PNG file
      png(filename = "plot1.png",
          width = 480, 
          height = 480, 
          units = "px")

      # Plot histogram
            hist(feb_table$Global_active_power, col="red", 
                 xlab="Global Active Power (kilowatts)", 
                 main="Global Active Power")

# Close PNG file
      dev.off()