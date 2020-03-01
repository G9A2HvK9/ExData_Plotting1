## creates time series line plot of sub-metering-1
plot(
        x = dat$DateTime, ## sets x-axis to DateTime
        y = dat$Sub_metering_1, ## sets y-axis to sub-metering-1 data
        type = 'l', ## sets plot-type to "line"
        xlab = NA, ## removes x-axis label
        ylab = 'Energy sub metering' ## sets y-axis label to 'Energy sub metering'
)

## adds line to active plot
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
)

## exports active graphics device to png
dev.copy(png, ## determines graphics device to be png
         filename = './plot3.png', ## determines file name & location
         width = 480, ## sets width
         height = 480, ## sets height
         units = 'px' ## sets units as pixels
)

## closes connection
dev.off()
