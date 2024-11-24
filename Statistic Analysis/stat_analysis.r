library(readr)

perform_t_test <- function(file_path, group_col, value_col) {
  user_data <- read_csv(file_path, show_col_types = FALSE)

  if (!(group_col %in% names(user_data) && value_col %in% names(user_data))) {
    stop("Specified columns not found in the uploaded data.")
  }

  if (any(is.na(user_data[[group_col]])) || any(is.na(user_data[[value_col]]))) {
    stop("Missing values detected in the specified columns.")
  }

  user_data[[group_col]] <- as.factor(user_data[[group_col]])

  t_test_result <- t.test(as.formula(paste(value_col, "~", group_col)), data = user_data)

  cat("Statistical Analysis Result:\n")
  print(t_test_result)
}

file_path <- "Statistic Analysis/xAPI-Edu-Data.csv"
group_col <- "StudentAbsenceDays"
value_col <- "raisedhands"

perform_t_test(file_path, group_col, value_col)
