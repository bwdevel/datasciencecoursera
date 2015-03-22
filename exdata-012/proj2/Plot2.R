# read source data
data <- readRDS("summarySCC_PM25.rds")

# subset needed data to only that from Baltimore
data <- subset(data, fips == "24510")

# agreggate data
data <- aggregate(Emissions ~ year, data, sum)

# open graphics device
png(filename = "plot2.png", width = 480, height = 480)

# settings for plot device
par("bg" = "transparent")

# bar chart
barplot(
    (data$Emissions)/10^6, names.arg=data$year, col = heat.colors(4),
    main="PM2.5 emission from Baltimore for 1999, 2002, 2005, and 2008",
    xlab="Year", ylab="Total Emissions",)

# close graphics device
dev.off()