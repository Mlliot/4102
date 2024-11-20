# install.packages("readr")         # Uncomment this line when first installing readr
library(readr)

# Uncomment lines 5-9 to test using test_data and comment out 11 and 12
# data <- data.frame(
#   ID = 1:5,
#   Name = c("Alice", "Bob", "Charlie", NA, "Eve"),
#   Score = c(85, 90, NA, 70, 88)
# )

file_path <- "test_data.csv"
data <- read_csv(file_path)

clean_data <- function(data) {

    if (file.exists("dirty_data.csv") || file.exists("cleaned_data.csv")) {
        file.remove("dirty_data.csv")
        file.remove("cleaned_data.csv")
    }

    if (!is.data.frame(data)) {
        stop("Input must be a data frame")
    }
  
    incomplete_rows <- data[!complete.cases(data), ]
    cleaned_data <- na.omit(data)
  
    write_csv(incomplete_rows, "dirty_data.csv")
    write_csv(cleaned_data, "cleaned_data.csv")
  
    print("Uploaded Data:")
    print(data)
  
    print("Cleaned Data:")
    print(cleaned_data)
  
    print("Incomplete Data:")
    print(incomplete_rows)
  
    return(list(cleaned_data = cleaned_data, incomplete_data = incomplete_rows))
}

result <- clean_data(data)