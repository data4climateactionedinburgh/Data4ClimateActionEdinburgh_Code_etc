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
unique(cycling_data$update)

cycling_data <- cycling_data |>
  rename(bike_count = count) |>
  mutate(date_of_count = as.Date(endTime))

# Spot-test: try counters for
#
test_locations <- c(
  "Stenhouse",
  "Blacket",
  "Innocent",
  "Meadow",
  "Hawkhill",
  "Harrison"
)

sample_data <-
  cycling_data |>
  filter(str_detect(location, str_c(test_locations, collapse = "|"))) #|>
# select(date_of_count, bike_count)

str(sample_data)
View(sample_data)
plot(sample_data |> select(date_of_count, bike_count))

cycling_grouped <- cycling_data |>
  group_by(date_of_count) |>
  summarise(day_total = sum(bike_count))

# group_by date yields a tibble of 3,595 rows,
# ie sixty rows for each date, perhaps corresponding to 60 counters.

plot(cycling_grouped)

# Get rid of those where withinExpectedLimits = FALSE
cycling_cleaned <- cycling_data |>
  filter(withinExpectedLimits) |>
  group_by(date_of_count) |>
  summarise(day_total = sum(bike_count))

# group_by date yields a tibble of 3,595 rows,
# ie sixty rows for each date, perhaps corresponding to 60 counters.

plot(cycling_cleaned)

# For D4CAE Dashboard, need to
# combine cleaned cycling with walking data.
# Columns are identical, so we can use rbind().
# And convert to rda.
