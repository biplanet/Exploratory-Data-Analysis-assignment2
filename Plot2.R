#Reading dataset
summaryData <- readRDS("summarySCC_PM25.rds")
sccData <- readRDS("Source_Classification_Code.rds")
#subset data
subset <- subset(summaryData, fips == "24510")
#get total emissons for subset
totalEmissions <- tapply(subset$Emissions, subset$year, sum)
#PNG Plot
png("plot2.png")
barplot(totalEmissions, xlab = "Year", ylab = "Total Emission (ton)", main = "Total Emission per year in Baltimore")
dev.off()