# README - Rainfall data

Data downloaded from SEPA - Scottish Environment Protection Agency - 
https://www2.sepa.org.uk/rainfall/ 

Data format: CSV

Periodicity: both daily and monthly datasets

Download method: Not yet automated, still manual download. The files can be found by clicking on the "Stations" tab at the top of the map. 

However, SEPA's API allows the files to be accessed with this formula: 
{baseurl}/api/Daily/{id}?csv=true&all=true

Rain stations' names are in: 
"rain_stations_edinburgh.csv" 

The D4CAE dashboard reads in the rainfall data from a pre-processed CSV called "aggreg_edinburgh_rainfall.csv" that has been aggregated based on the files downloaded from SEPA. The columns are as follows: 
 - Timestamp, rainfall_in_mm, rain_station

The options in the dropdown for rain station are extracted from the input file. Hence, these are short names added in the pre-processing. And we can offer the user an option that provides an average of the rain stations if we calculate this and add it as a set of rows with timestamps in a similar format to the individual rain stations, that is one workaround for displaying the mean.  