# README - documentation of data from COD

Data was downloaded from the Cycling Open Data (COD) website, a usmart platform. 
https://usmart.io/org/cyclingscotland/

Slightly non-intuitive process: 
* Created a login. 
* Searched the COD datasets for 'Edinburgh', as the data from City of Edinburgh Council (CEC) is presented in its own datasets, some hourly, some daily. 
* Sent in the requests for the two datasets relevant to the current work, using the request access buttons, the City of Edinburgh daily walking counts and daily cycling counts respectively. These are both made available under an Open Govt Licence. 
* Once access confirmed, returned to the dataset page for the daily cycling. 
* Checked by filtering - all 215,000 records provided by CEC. 
* Clicked the dataset button to downloaded the CSV file, took under two minutes for the website to make the data ready. 
* Used the website download feature, top right-hand corner white download icon, then in the menu that opens, click blue download icon to actually get the file to download.  


## WALKING: City of Edinburgh Council - Daily *WALKING* counts from automatic cycling counters
   
https://usmart.io/org/cyclingscotland/discovery/discovery-view-detail/fca2f5f0-6fdd-48cf-8325-778f1c4bb32a

### Description
A real-time daily upload from each pedestrian counter within City of Edinburgh Council's network
### Additional Information
The walking counts supplied is raw, uncleaned data. Extended counts of zero, or unusually high counts, may be due to a malfunctioning counter. Data consumers must decide whether counts are genuine and suitable for use. Managed by Paths for All.
### Themes
Transport / Mobility
### Point of Contact
Paths for All Data 
### Licence
Open Government Licence

The provider column in the data states "City of Edinburgh Council" for all rows. 

The sixty counters' locations are: 
> # Where are the counters? 
> unique(CEC_daily_cycling_COD_alldates[["location"]])
 [1] "Gilmerton Road"                           "Water of Leith"                          
 [3] "A8 Corstorphine Road"                     "Inverleith Row"                          
 [5] "Whitehouse Loan"                          "Carrington Road Eastbound"               
 [7] "Gilmerton Station Road"                   "Old Dalkeith Road"                       
 [9] "Dalry Road"                               "Dundee Street"                           
[11] "Shawfair"                                 "Portobello Promenade"                    
[13] "Raeburn Place"                            "Blacket Avenue"                          
[15] "A8 Wester Coates"                         "Little France ELGT"                      
[17] "London Road"                              "Nicolson Street"                         
[19] "A90 Deans Bridge"                         "Fishwives Causeway"                      
[21] "Carrington Road Westbound"                "Roseburn Path"                           
[23] "ELGT Little France South"                 "Crewe Road South"                        
[25] "North Meadow Walk, Link"                  "Morrison Street"                         
[27] "North Meadow Walk, Main Path"             "Rodney Street Tunnel"                    
[29] "Stenhouse Drive"                          "Roseburn Park"                           
[31] "Straiton Path"                            "Harrison Park"                           
[33] "Bruntsfield Place Northbound"             "Melville Drive Southbound"               
[35] "Mayfield Road Southbound"                 "Melville Drive Main Path"                
[37] "Melville Drive Link"                      "Mayfield Road Northbound"                
[39] "Bruntsfield Place Southbound"             "Melville Drive Northbound"               
[41] "Inverleith Park"                          "Peffermill Road (Dial-Up CA)"            
[43] "Steadfast Gate"                           "Hawkhill Avenue (Dial-Up CA)"            
[45] "Seafield Street (Dial-Up CA)"             "RBS Gogar (Dial-Up CA)"                  
[47] "Forth Road Bridge (Dial-Up CA)"           "Blackhall (Dial-Up CA)"                  
[49] "Silverknowes (Dial-Up CA)"                "Queensferry - Dalmeny (Dial-Up CA)"      
[51] "North Edinburgh Access Road (Dial-Up CA)" "Cultins Road (Dial-Up CA)"               
[53] "Middle Meadow Walk (Dial-Up CA)"          "Spylaw Park"                             
[55] "Cramond Brigg"                            "Carrick Knowe Golf Course (Dial-Up CA)"  
[57] "Innocent Railway Bridge(Dial-Up CA)"      "Union Canal - Wester Hailes"             
[59] "Portobello Prom (Dial-Up CA)"             "Wester Coates"   

## CYCLING: City of Edinburgh Council - Daily cycling counts from automatic cycling counters

https://usmart.io/org/cyclingscotland/discovery/discovery-view-detail/b1f0bd42-e220-465e-99a3-c4f62824f21f 

### Description
A real-time daily upload from each cycling counter within City of Edinburgh Council's network.
### Additional Information
The cycling counts supplied is raw, uncleaned data. Extended counts of zero, or unusually high counts, may be due to a malfunctioning counter. Data consumers must decide whether counts are genuine and suitable for use.
### Themes
Transport / Mobility
### Point of Contact
Cycling Scotland Monitoring
### Licence
Open Government Licence
