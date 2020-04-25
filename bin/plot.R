library(ggplot2)
diet <- read.delim("data/diet.tsv")
diet$date <- as.Date(diet$date)

png("image/weight.png")
ggplot(diet, aes(x=date, y=weight)) + geom_point() + geom_line()
dev.off()

png("image/body_fat_percentage.png")
ggplot(diet, aes(x=date, y=body_fat_percentage)) + geom_point() + geom_line()
dev.off()

png("image/visceral_fat.png")
ggplot(diet, aes(x=date, y=visceral_fat)) + geom_point() + geom_line()
dev.off()

png("image/skeletal_muscle_rate.png")
ggplot(diet, aes(x=date, y=skeletal_muscle_rate)) + geom_point() + geom_line()
dev.off()

png("image/body_age.png")
ggplot(diet, aes(x=date, y=body_age)) + geom_point() + geom_line()
dev.off()

png("image/basal_metabolic_rate.png")
ggplot(diet, aes(x=date, y=basal_metabolic_rate)) + geom_point() + geom_line()
dev.off()

png("image/bmi.png")
ggplot(diet, aes(x=date, y=BMI)) + geom_point() + geom_line()
dev.off()
