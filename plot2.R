## creates time series line graph of global active power
plot(
        x = dat$DateTime, ## sets x-axis to DateTime
        y = dat$Global_active_power, ## sets y-axis to Global Active Power
        type = 'l', ## sets type to "line"
        xlab = '', # removes x-axis label
        ylab = 'Global Active Power (kilowatts)' ## sets y-axis label
)

## copies plot to png
dev.copy(png, ## determines graphics device to be png
         filename = './plot2.png', ## determines file name & location
         width = 480, ## sets width
         height = 480, ## sets height
         units = 'px' ## sets units as pixels
)

## closes connection
dev.off()
