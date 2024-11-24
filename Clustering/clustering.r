library(ggplot2)
library(dplyr)

uploaded_data <- read.csv("Clustering/CC_GENERAL.csv")

clustering_data <- uploaded_data %>% dplyr::select(-CUST_ID)

valid_rows <- complete.cases(clustering_data)
clustering_data <- clustering_data[valid_rows, ]
uploaded_data <- uploaded_data[valid_rows, ]

set.seed(123)
kmeans_result <- kmeans(clustering_data, centers = 3)

uploaded_data$Cluster <- as.factor(kmeans_result$cluster)

cluster_plot <- ggplot(uploaded_data, aes(x = CREDIT_LIMIT, y = PURCHASES, color = Cluster)) +
  geom_point(size = 3) +
  labs(title = "K-Means Clustering", x = "Credit Limit", y = "Purchases") +
  theme_minimal()

print(cluster_plot)
