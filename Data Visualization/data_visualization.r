install.packages(c("ggplot2", "dplyr", "readr", "gridExtra", "scales"))
library(ggplot2)
library(dplyr)
library(readr)
library(gridExtra)
library(scales)

data <- read_csv("Data Visualization/Housing_Price_Data.csv")

data$price_k <- data$price / 1000

histogram <- ggplot(data, aes(x = price_k)) +
  geom_histogram(binwidth = 50, fill = "blue", alpha = 0.7) +
  labs(title = "Histogram of Property Prices",
       x = "Price (in thousands)",
       y = "Frequency") +
  scale_x_continuous(labels = scales::comma)

scatter_plot <- ggplot(data, aes(x = area, y = price_k, color = furnishingstatus)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, aes(group = furnishingstatus, color = furnishingstatus)) +
  labs(title = "Scatter Plot of Area vs. Price",
       x = "Area (sq ft)",
       y = "Price (in thousands)") +
  scale_y_continuous(labels = scales::comma)

boxplot <- ggplot(data, aes(x = furnishingstatus, y = price_k, fill = furnishingstatus)) +
  geom_boxplot() +
  labs(title = "Boxplot of Prices by Furnishing Status",
       x = "Furnishing Status",
       y = "Price (in thousands)") +
  scale_y_continuous(labels = scales::comma)

bar_plot <- ggplot(data, aes(x = airconditioning)) +
  geom_bar(fill = "green", alpha = 0.7) +
  labs(title = "Count of Properties with/without Air Conditioning",
       x = "Air Conditioning",
       y = "Count")

grid.arrange(histogram, scatter_plot, boxplot, bar_plot, nrow = 2, ncol = 2)
