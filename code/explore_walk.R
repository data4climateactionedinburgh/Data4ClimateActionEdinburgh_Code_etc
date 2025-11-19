# Explore walking data
library(tidyverse)
library(here)

data_folder <- here("data")
# list.files("data/walking")
walkg_data_file <- here(
  data_folder,
  "walking",
  "CEC_daily_walking_COD_alldates_allsites_8d227f3f-9478-4524-886c-f8eb2dcd4834.csv"
)
walking_data <- read_csv(walkg_data_file)
