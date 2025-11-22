# Get and prepare rainfall data for D4CAE dashboard

library(tidyverse)
library(here)

# SEPA API allows download in this form:
# {baseurl}/api/Daily/{id}?csv=true&all=true
# CSV : {baseurl}/api/Daily/{id}?csv=true&all=true

Edin_stations <- read_csv(
    here(
        "data",
        "rainfall",
        "rain_stations_edinburgh.csv"
    ),
    col_type = list(.default = col_character())
)

aggreg_edinburgh_rainfall <- tibble()

rainfiles <- tibble("filename" = list.files(here("data", "rainfall"))) |>
    filter(str_detect(filename, "\\.csv"))

monthly_rainfiles <- rainfiles |>
    filter(str_detect(filename, "monthly"))

#aggreg_edinburgh_rainfall <- map(monthly_rainfiles,
#    read_csv(here("data", "rainfall", )))

#function import_rain
