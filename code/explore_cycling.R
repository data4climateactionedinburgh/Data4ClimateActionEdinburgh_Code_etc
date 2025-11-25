# Explore cycling data
library(tidyverse)
library(here)

data_folder <- here("data")
# list.files("data/cycling")
cyc_data_file <- here(
  data_folder,
  "cycling",
  "CEC_daily_cycling_COD_alldates_allsites_5344a7be-26dd-4262-8e0a-20a0f9f5de0a.csv"
)
cycling_data <- read_csv(cyc_data_file)

# What are the locations of the counters?
unique(cycling_data["location"]) |>
  print(n = 2000)

# read_csv is guessing endTime to be a timestamp, so I don't need to set that.
summary(cycling_data["endTime"])
# Data goes back to Jan 2016.

str(cycling_data)
unique(cycling_data$class)
# "cycle"

cycling_data <- cycling_data |>
  rename(bike_count = count) |>
  mutate(date_of_count = as.Date(endTime))


cycling_to_plot <- cycling_data |>
  group_by(endTime) |>
  summarise(day_total = sum(bikeCount))


simple_line_plot_cyc <- cycling_to_plot
