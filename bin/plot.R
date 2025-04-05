library(zoo);
library(ggplot2)
diet <- read.delim("data/diet.tsv")
diet$date <- as.Date(diet$date)
diet$weight_ma7 <- rollmean(diet$weight, 7, fill = NA, align = "right")
diet$body_fat_percentage_ma7 <- rollmean(diet$body_fat_percentage, 7, fill = NA, align = "right")
diet$visceral_fat_ma7 <- rollmean(diet$visceral_fat, 7, fill = NA, align = "right")
diet$skeletal_muscle_rate_ma7 <- rollmean(diet$skeletal_muscle_rate, 7, fill = NA, align = "right")
diet$body_age_ma7 <- rollmean(diet$body_age, 7, fill = NA, align = "right")
diet$basal_metabolic_rate_ma7 <- rollmean(diet$basal_metabolic_rate, 7, fill = NA, align = "right")
diet$BMI_ma7 <- rollmean(diet$BMI, 7, fill = NA, align = "right")

png("image/weight.png")
ggplot(diet, aes(x=date)) +
  geom_line(aes(y=weight), color="gray") +
  geom_line(aes(y=weight_ma7), color="blue")
dev.off()

png("image/body_fat_percentage.png")
ggplot(diet, aes(x=date)) +
  geom_line(aes(y=body_fat_percentage), color="gray") +
  geom_line(aes(y=body_fat_percentage_ma7), color="blue")
dev.off()

png("image/visceral_fat.png")
ggplot(diet, aes(x=date)) +
  geom_line(aes(y=visceral_fat), color="gray") +
  geom_line(aes(y=visceral_fat_ma7), color="blue")
dev.off()

png("image/skeletal_muscle_rate.png")
ggplot(diet, aes(x=date)) +
  geom_line(aes(y=skeletal_muscle_rate), color="gray") +
  geom_line(aes(y=skeletal_muscle_rate_ma7), color="blue")
dev.off()

png("image/body_age.png")
ggplot(diet, aes(x=date)) +
  geom_line(aes(y=body_age), color="gray") +
  geom_line(aes(y=body_age_ma7), color="blue")
dev.off()

png("image/basal_metabolic_rate.png")
ggplot(diet, aes(x=date)) +
  geom_line(aes(y=basal_metabolic_rate), color="gray") +
  geom_line(aes(y=basal_metabolic_rate_ma7), color="blue")
dev.off()

png("image/bmi.png")
ggplot(diet, aes(x=date)) +
  geom_line(aes(y=BMI), color="gray") +
  geom_line(aes(y=BMI_ma7), color="blue")
dev.off()

diet$body_fat_weight_ma7 <- rollmean(diet$body_fat_percentage * diet$weight / 100, 7, fill = NA, align = "right")

png("image/body_fat_weight.png")
ggplot(diet, aes(x=date)) +
  geom_line(aes(y=body_fat_percentage * weight / 100), color="gray") +
  geom_line(aes(y=body_fat_weight_ma7), color="blue")
dev.off()

diet$skeletal_muscle_weight_ma7 <- rollmean(diet$skeletal_muscle_rate * diet$weight / 100, 7, fill = NA, align = "right")

png("image/skeletal_muscle_weight.png")
ggplot(diet, aes(x=date)) +
  geom_line(aes(y=skeletal_muscle_rate * weight / 100), color="gray") +
  geom_line(aes(y=skeletal_muscle_weight_ma7), color="blue")
dev.off()

# recent three months

latest_date <- max(diet$date, na.rm = TRUE)
three_months_ago <- latest_date - 90
diet_recent <- subset(diet, date >= three_months_ago)

png("image/weight_recent.png")
ggplot(diet_recent, aes(x=date)) +
  geom_line(aes(y=weight), color="gray") +
  geom_line(aes(y=weight_ma7), color="blue")
dev.off()

png("image/body_fat_percentage_recent.png")
ggplot(diet_recent, aes(x=date)) +
  geom_line(aes(y=body_fat_percentage), color="gray") +
  geom_line(aes(y=body_fat_percentage_ma7), color="blue")
dev.off()

png("image/visceral_fat_recent.png")
ggplot(diet_recent, aes(x=date)) +
  geom_line(aes(y=visceral_fat), color="gray") +
  geom_line(aes(y=visceral_fat_ma7), color="blue")
dev.off()

png("image/skeletal_muscle_rate_recent.png")
ggplot(diet_recent, aes(x=date)) +
  geom_line(aes(y=skeletal_muscle_rate), color="gray") +
  geom_line(aes(y=skeletal_muscle_rate_ma7), color="blue")
dev.off()

png("image/body_age_recent.png")
ggplot(diet_recent, aes(x=date)) +
  geom_line(aes(y=body_age), color="gray") +
  geom_line(aes(y=body_age_ma7), color="blue")
dev.off()

png("image/basal_metabolic_rate_recent.png")
ggplot(diet_recent, aes(x=date)) +
  geom_line(aes(y=basal_metabolic_rate), color="gray") +
  geom_line(aes(y=basal_metabolic_rate_ma7), color="blue")
dev.off()

png("image/bmi_recent.png")
ggplot(diet_recent, aes(x=date)) +
  geom_line(aes(y=BMI), color="gray") +
  geom_line(aes(y=BMI_ma7), color="blue")
dev.off()

png("image/body_fat_weight_recent.png")
ggplot(diet_recent, aes(x=date)) +
  geom_line(aes(y=body_fat_percentage * weight / 100), color="gray") +
  geom_line(aes(y=body_fat_weight_ma7), color="blue")
dev.off()

png("image/skeletal_muscle_weight_recent.png")
ggplot(diet_recent, aes(x=date)) +
  geom_line(aes(y=skeletal_muscle_rate * weight / 100), color="gray") +
  geom_line(aes(y=skeletal_muscle_weight_ma7), color="blue")
dev.off()
