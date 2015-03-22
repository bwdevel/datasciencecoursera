library(ggplot2)

# read raw date
data <- readRDS("summarySCC_PM25.rds")

# subset data to Baltimore
data <- subset(data, fips == "24510")

# plot data
g <- ggplot(aes(factor(year), Emissions, fill = type), data = data)
g + geom_bar(stat = "identity") + facet_grid(.~type) + theme_bw() +
    guides(fill = FALSE) +
    labs(x = "Year", 
         y = expression("Total Emissions")) + 
    labs(title = expression("PM2.5 emission from Baltimore for 1999, 2002, 2005, and 2008"))

# Save the file to plot3.png
ggsave(file = "plot3.png")