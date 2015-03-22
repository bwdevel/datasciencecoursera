# read source data
data <- readRDS("summarySCC_PM25.rds")

# aggregate raw data
data <- aggregate(Emissions ~ year, data, sum)

# open graphics device
png(filename = "plot1.png", width = 480, height = 480)

# settings for plot device
par("bg" = "transparent")

# bar chart
barplot(
    (data$Emissions)/10^6, names.arg=data$year, col = heat.colors(4),
    main="PM2.5 emission from all sources for 1999, 2002, 2005, and 2008",
    xlab="Year", ylab="Total Emissions",)

# close graphics device
dev.off()