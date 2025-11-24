# README - Dataset Documentation 

# Temperature
All files with 'hadukgrid' in the filename downloaded from CEDA archive,
and provided by Hadley Centre. Format: NetCDF. 

Met Office; Hollis, D.; McCarthy, M.; Kendon, M.; Legg, T.; Simpson, I. (2018): HadUK-Grid gridded and regional average climate observations for the UK. Centre for Environmental Data Analysis, date of citation. 
http://catalogue.ceda.ac.uk/uuid/4dc8450d889a491ebb20e724debe2dfb


The 1km v 1.3.1 download page: 
https://data.ceda.ac.uk/badc/ukmo-hadobs/data/insitu/MOHC/HadOBS/HadUK-Grid/v1.3.1.ceda/1km/ 

### Bug Fix Applied

**Problem:** The script was failing with the error:
```
Error in `cli_block()`:
! `x` must not contain list or matrix columns:
✖ invalid columns at index(s): 1
```

**Cause:** In some cases, when `bind_rows()` combines results from multiple NetCDF file extractions, certain columns may inadvertently become list-columns, which cannot be written directly to CSV format using `write_csv()`.

**Solution:** Before writing to CSV, the script now checks for and converts any list-columns to character format using:

```r
daily_combined <- daily_combined %>%
  mutate(across(where(is.list), as.character))
```

This ensures all columns are atomic (not list-columns) before saving, preventing the write_csv error.

### Configuration

The script is configured for Edinburgh city centre by default:
- Latitude: 55.9533°N
- Longitude: -3.1883°E (west)

Data files should be placed in `data/temperature/` directory with patterns:
- Daily max: `tasmax_hadukgrid_uk_1km_day*.nc`
- Daily min: `tasmin_hadukgrid_uk_1km_day*.nc`
- Monthly mean: `tas_hadukgrid_uk_1km_mon*.nc`

### Output

The script generates:
- `edinburgh_daily_temps_point.csv` - Daily temperature data (max and min)
- `edinburgh_monthly_mean_temps_point.csv` - Monthly mean temperatures
- `edinburgh_monthly_from_daily.csv` - Monthly averages computed from daily data
- Temperature plots (printed to screen or save with `ggsave()`)

### Usage

```r
source("Data4climateactionedinburgh_code_etc/read_haduk_temperature_edinburgh.R")
```

## Previous version - documentation for the work on temperature carried out in first half of 2025

## Temperature data files #

The 2024 monthly temperature data files were downloaded from the Met Office Hadley 
Centre HadUK-Grid in February 2025 (Hollis et al. 2019). They were made 
available from the Hadley Centre under an Open Government Licence (OGL).  

These files contain provisional measurements of average air temperature (the 
'tas' field) for the 1km grid. Confirmed measurements are not yet available. 
Twelve files were downloaded, one for each month of 2024. They are named with 
the final two digits of the filename giving the number of the month, eg March 
2024 ends in '03', April ends in '04' etc: 

tas_hadukgrid_uk_1km_mon_202403.nc 

This is separate from the daily average data, contained in the daily files, 
which have tasmax or tasmin, there's no tas file eg
tasmax_hadukgrid_uk_1km_day_20240301-20240331.nc
tasmin_hadukgrid_uk_1km_day_20240301-20240331.nc

The 2023 annual data file for tas the mean temperature was downloaded from the
CEDA archive. CEDA released the data under an OGL. 

tas_hadukgrid_uk_1km_ann_202301-202312.nc

Analysis - use CRAN packages - netcdf is a binary file format of course. 
https://cran.r-project.org/web/packages/ncdf4/index.html
https://cran.r-project.org/web/packages/ncdf4.helpers/index.html 

"DATA LOCATION, FORMATAND ACCESSIBILIT YVersion 1.0.0.0 of the HadUK‐Grid dataset is available forusers to download from the CEDA Archive (Met Office,2018). The grids are packaged as CF‐compliant (cfconventions.org) netCDF files (Unidata, 2019). The primary datasetis a 1 × 1 km grid on the British National Grid projection(EPSG:27700) "
Hollis et al 2019

## Approach

https://nordatanet.github.io/NetCDF_in_R_from_beginner_to_pro/03_extracting_data_to_different_formats.html
 
## References ## 
Hollis, D, McCarthy, M, Kendon, M, Legg, T and Simpson, I (2019), HadUK-Grid - 
A new UK dataset of gridded climate observations, Geosci. Data J., 6(2), 151-159. 
<https://doi.org/10.1002/gdj3.78>

Provisional monthly 2024 data: 
https://www.metoffice.gov.uk/hadobs/hadukgrid/

The HadUK grid
https://www.metoffice.gov.uk/research/climate/maps-and-data/data/haduk-grid/haduk-grid 

Open Government Licence v3 The National Archives 
https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/