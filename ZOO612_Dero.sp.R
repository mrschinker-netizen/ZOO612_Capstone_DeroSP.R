getwd()
setwd("~/Desktop/ZOO611_RStudio")

library(readxl)
mydata <- read.csv("ZOO612_DerowormsConsolidatedData.csv")


# Load the ggplot2 package
library(ggplot2)

# Create a data frame from your data
df <- data.frame(
  Time = rep(c(0, 10, 20, 30, 40, 50), times = 5),
  Treatment = rep(c("Control", "0.1", "0.2"), each = 6 * 5),
  Value = c(
    10, 10, 2, 3, 6, 2,
    10, 10, 10, 10, 10, 1,
    6, 10, 10, 6, 7, 10,
    10, 10, 10, 10, 10, 6,
    2, 8, 10, 10, 6, 6,
    10, 7, 7, 5, 3, 3,
    9, 8, 2, 3, 2, 3,
    9, 10, 4, 0, 2, 0,
    7, 7, 3, 3, 3, 2,
    10, 10, 6, 1, 3, 3,
    10, 3, 1, 0, 2, 3,
    10, 10, 10, 2, 10, 10,
    10, 10, 1, 3, 4, 10,
    5, 8, 3, 0, 5, 10,
    5, 10, 0, 3, 10, 2 ))

# Calculate the means and standard errors for each Treatment
means <- aggregate(Value ~ Treatment + Time, data = df, mean)
sd <- aggregate(Value ~ Treatment + Time, data = df, sd)
se <- aggregate(Value ~ Treatment + Time, data = df, mean_se)
as.numeric(se$Value[,"y"])
as.numeric(se$Value[,"ymin"])
as.numeric(se$Value[,"ymax"])
# Create the plot
ggplot(se, aes(x = Time, y = as.numeric(se$Value[,"y"]), color = Treatment, group = Treatment)) +
  geom_line() +
  geom_errorbar(aes(ymin = as.numeric(se$Value[,"ymin"]), ymax = as.numeric(se$Value[,"ymax"]), width = 0.2)) +
  labs(x = "Time in minutes", y = "Average Movement (scale of 0-10)") +
  scale_color_manual(values = c("Control" = "black", "0.1" = "red", "0.2" = "blue")) +
  theme_bw()


# Install and load the statmod package
install.packages("statmod")
library(statmod)

# Calculate the standard error
se <- standard_



# Calculate the standard error
se2.0 <- standard_error(df)
se2.0 <- aggregate(Value ~ Treatment + Time, data = df, standard.error)
# Print the standard error
se2.0


