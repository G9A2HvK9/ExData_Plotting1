## sets up plotting grid with 4 panels - 2 rows & 2 columns
par(mfrow = c(2, 2))

## creates time series line graph of global active power
plot(
        x = dat$DateTime, ## sets x-axis to DateTime
        y = dat$Global_active_power, ## sets y-axis to Global Active Power
        type = 'l', ## sets type to "line"
        xlab = '', # removes x-axis label
        ylab = 'Global Active Power (kilowatts)' ## sets y-axis label
)

## creates time series line graph of voltage
plot(
        x = dat$DateTime, ## sets x-axis to DateTime
        y = dat$Voltage, ## sets y-axis to Voltage
        type = 'l', ## sets type to "line"
        xlab = 'datetime', ## sets x-axis label to be 'datetime'
        ylab = 'Voltage' ## sets y-axis label
)

## creates time series line plot of sub-metering-1
plot(
        x = dat$DateTime, ## sets x-axis to DateTime
        y = dat$Sub_metering_1, ## sets y-axis to sub-metering-1 data
        type = 'l', ## sets plot-type to "line"
        xlab = NA, ## removes x-axis label
        ylab = 'Energy sub metering' ## sets y-axis label
)

## ads line to active plot
lines(
        x = dat$DateTime, ## sets x-axis data to DateTime
        y = dat$Sub_metering_2, ## sets y-axis data to sub-metering-2
        col = 'red' ## sets color to "red"
)

## adds line to active plot
lines(
        x = dat$DateTime, ## sets x-axis data to DateTime
        y = dat$Sub_metering_3, ## sets y-axis data to sub-metering-3
        col = 'blue' ## sets color to "blue"
)

## adds legend to graph
legend(
        x = 'topright', ## sets location to "top right"
        legend = names(dat[5:7]), ## adds legend names from table headers
        lty = 1, ## determines line type to be 1
        col = c('black', 'red', 'blue'), ## determines colors
        cex = 0.5, ## reduces size of the legend by half
        bty = 'n' ## removes box around legend
)
## creates time series line graph of global reactive power
plot(
        x = dat$DateTime, ## sets x-axis to DateTime
        y = dat$Global_reactive_power, ## sets y-axis to Global Active Power
        type = 'l', ## sets type to "line"
        xlab = 'datetime', ## sets x-axis label to be 'datetime'
        ylab = names(dat[2]) ## sets y-axis label to name of 'Global_reactive_power'
)

## exports active graphics device to png
dev.copy(png, ## determines graphics device to be png
         filename = './plot4.png', ## determines file name & location
         width = 480, ## sets width
         height = 480, ## sets height
         units = 'px' ## sets units as pixels
)

## closes connection
dev.off()