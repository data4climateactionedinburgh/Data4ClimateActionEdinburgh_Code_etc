# Get and prepare rainfall data for D4CAE dashboard

library(tidyverse)
library(here)
library(janitor)

# SEPA API allows download in this form:
# {baseurl}/api/Daily/{id}?csv=true&all=true
# CSV : {baseurl}/api/Daily/{id}?csv=true&all=true

Edin_stations <- read_csv(
    here(
        "data",
        "rainfall",
        "rain_stations_edinburgh.csv"
    )
)

aggreg_edinburgh_rainfall <- tibble()
rainfall_path <- here("data", "rainfall")

monthly_rainfiles <- list.files(
    path = rainfall_path,
    pattern = "monthly.*\\.csv$",
    full.names = TRUE
)

daily_rainfiles <- list.files(
    path = rainfall_path,
    pattern = "daily.*\\.csv$",
    full.names = TRUE
)

## MONTHLY
aggreg_rainfall_mthly <- monthly_rainfiles |>
    map_dfr(
        ~ {
            file_name <- basename(.x)
            rain_station <- str_extract(file_name, "^[:alpha:]+(?=_)")
            read_csv(.x) |>
                rename("rainfall_in_mm" = Value) |>

                mutate(
                    rain_station = rain_station
                )
        }
    )

mean_rows_mthly <- aggreg_rainfall_mthly |>
    group_by(Timestamp) |>
    summarise(
        rainfall_in_mm = round_half_up(
            mean(rainfall_in_mm, na.rm = TRUE),
            digits = 2
        ),
        .groups = "drop"
    ) |>
    mutate(rain_station = "Edinburgh average")


## DAILY

aggreg_edinburgh_rainfall <- daily_rainfiles |>
    map_dfr(
        ~ {
            file_name <- basename(.x)
            rain_station <- str_extract(file_name, "^[:alpha:]+(?=_)")
            read_csv(.x) |>
                rename("rainfall_in_mm" = Value) |>

                mutate(
                    rain_station = rain_station
                )
        }
    )

mean_rows <- aggreg_edinburgh_rainfall |>
    group_by(Timestamp) |>
    summarise(
        rainfall_in_mm = round_half_up(
            mean(rainfall_in_mm, na.rm = TRUE),
            digits = 1
        ),
        .groups = "drop"
    ) |>
    mutate(rain_station = "Edinburgh average")

## BRING IT ALL TOGETHER
aggreg_edinburgh_rainfall <- bind_rows(mean_rows, aggreg_edinburgh_rainfall)

# To be added after troubleshooting - bind in the monthly rows too perhaps

write_csv(
    aggreg_edinburgh_rainfall,
    here(rainfall_path, "aggreg_edinburgh_rainfall.csv"),
    quote = "all"
)

# Potentially write out a separate file for monthly data
