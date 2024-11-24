library(ggplot2)

music_data <- read.csv("Linear Regression/Spotify Most Streamed Songs.csv")

str(music_data)

music_data$streams <- as.numeric(gsub(",", "", music_data$streams))

music_data <- music_data[music_data$streams >= 100000000, ]

music_data <- music_data[!is.na(music_data$streams) & 
                         !is.na(music_data$danceability_.) & 
                         !is.na(music_data$valence_.) & 
                         !is.na(music_data$energy_.) & 
                         !is.na(music_data$bpm), ]

summary(music_data)

model <- lm(streams ~ danceability_. + valence_. + energy_. + bpm, data = music_data)

summary(model)

user_input <- data.frame(
  bpm = c(130, 145), 
  danceability_. = c(65, 60), 
  valence_. = c(75, 70), 
  energy_. = c(75, 70)
)

predicted_streams <- predict(model, user_input)

result <- cbind(user_input, Predicted_Streams = predicted_streams)
print("Prediction Results:")
print(result)

regression_plot <- ggplot(music_data, aes(x = bpm, y = streams)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", col = "red") +
  geom_point(data = user_input, aes(x = bpm, y = predicted_streams), color = "green", size = 3) +
  labs(title = "Linear Regression with Predictions", x = "BPM", y = "Streams")

print(regression_plot)
