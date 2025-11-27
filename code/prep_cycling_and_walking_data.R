# Prep cycling and walking data
# for D4CAE dashboard active travel dataviz

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

# Need to keep the column name "count" since that is what the dashboard looks for.
# Need to keep 'class' with values 'cycle' and 'pedestrian'
# Need to keep endTime and startTime, as the dashboard widgets use these to filter data

# Get rid of those where withinExpectedLimits = FALSE
cycling_cleaned <- cycling_data |>
  filter(withinExpectedLimits)

# For D4CAE Dashboard, need to
# combine cleaned cycling with walking data.
# Columns are identical, so we can use rbind().
# And convert to rda.

walkg_data_file <- here(
  data_folder,
  "walking",
  "CEC_daily_walking_COD_alldates_allsites_8d227f3f-9478-4524-886c-f8eb2dcd4834.csv"
)
walking_data <- read_csv(walkg_data_file)

walking_cleaned <- walking_data |>
  filter(withinExpectedLimits)
