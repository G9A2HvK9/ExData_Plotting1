## checks to see if data repo exists. If not, creates repo
if (!file.exists('./99_data/')){
        dir.create('./99_data')
}
        
## checks to see if data file exists. If not, downloads and unzips file
if (!file.exists('./99_data/data.txt')){
        ## downloads zip file from course website
        download.file(
                'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',
                './99_data/UCIData.zip')
        ## unzips zip file
        unzip(
                './99_data/UCIData.zip',
                exdir = './99_data/'
        )
        ## renames unzipped file to data.txt
        file.rename(
                './99_data/household_power_consumption.txt',
                './99_data/data.txt'
        )
        ## removes zip file
        file.remove(
                './99_data/UCIData.zip'
        )
}

## calculates the required memory to work with data set 'data.txt'
calc_memory <- function(variable_count, row_count, bytes){
        memory_needed_bytes <- variable_count * row_count * bytes
        memory_needed_gb <- round(memory_needed_bytes / 1073741824, digits = 4)
        message <- paste('You will need ', memory_needed_gb, ' GB of memory to work with this file')
        return(message)
}

## calculates memory needed to work with file and prints message to console
## [1] "You will need  0.1392  GB of memory to work with this file"
calc_memory(9, 2075259, 8)

## reads data.txt file into data.table and assigns correct colClasses, except to Date and Time
dat <- data.table::fread(
        file = './99_data/data.txt',
        sep = ';',
        header = TRUE,
        na.strings = '?',
        verbose = TRUE,
        colClasses = c(
                'character',
                'character',
                'numeric',
                'numeric',
                'numeric',
                'numeric',
                'numeric',
                'numeric',
                'numeric'
        ),
        dec = '.',
        strip.white = TRUE
)

## appends dat$Date and dat$Time into a single POSIXct column and removes Date and Time column
dat$DateTime <- as.POSIXct(paste(dat$Date, dat$Time), format = '%d/%m/%Y %H:%M:%S')
dat$Date <- NULL
dat$Time <- NULL


## removes all unneeded observations, filtering by date == 2007-02-01 OR 2007-02-02
dat <- dplyr::filter(dat, DateTime >= '2007-02-01' & DateTime < '2007-02-03')
