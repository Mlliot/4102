install.packages("readr")
library(readr)

file_path <- "Data Cleaning/test_data.csv"
data <- read_csv(file_path)

clean_data <- function(data) {

    if (file.exists("Data Cleaning/dirty_data.csv") || file.exists("Data Cleaning/cleaned_data.csv")) {
        file.remove("Data Cleaning/dirty_data.csv")
        file.remove("Data Cleaning/cleaned_data.csv")
    }

    if (!is.data.frame(data)) {
        stop("Input must be a data frame")
    }
  
    incomplete_rows <- data[!complete.cases(data), ]
    cleaned_data <- na.omit(data)
  
    write_csv(incomplete_rows, "Data Cleaning/dirty_data.csv")
    write_csv(cleaned_data, "Data Cleaning/cleaned_data.csv")
  
    print("Uploaded Data:")
    print(data)
  
    print("Cleaned Data:")
    print(cleaned_data)
  
    print("Incomplete Data:")
    print(incomplete_rows)
  
    return(list(cleaned_data = cleaned_data, incomplete_data = incomplete_rows))
}

result <- clean_data(data)