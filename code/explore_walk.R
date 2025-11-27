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

# What are the locations of the counters?
unique(walking_data["location"]) |>
  print(n = 2000)
# sixty counters, very, very similar to cycling counters

# read_csv is guessing endTime to be a timestamp, so I don't need to set that.
summary(walking_data["endTime"])
# Data goes back to Jan 2016.

unique(walking_data$update)

# Check column names.
# Then group by date of count , pipe to
# summarise daily total = sum of count

walking_data |>
  filter(withinExpectedLimits) |>
  summarise(group_by())
