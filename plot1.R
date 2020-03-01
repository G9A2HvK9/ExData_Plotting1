## creates histogram of global active power
hist(dat$Global_active_power, 
     col = 'red', ## sets color to red
     main = 'Global Active Power', ## sets main title
     xlab = 'Global Active Power (kilowatts)', ## sets x-axis label
     )

## exports plot from screen device to .png
dev.copy(png, ## determines graphics device to be png
         filename = './plot1.png', ## determines file name & location
         width = 480, ## sets width
         height = 480, ## sets height
         units = 'px' ## sets units as pixels
)

## closes connection
dev.off()
