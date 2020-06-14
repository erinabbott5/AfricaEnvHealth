# AfricaEnvHealth


### Author Information:
Erin Abbott
Environmental and Urban Studies major, GIS minor, pre-med
University of Chicago '21


### Overview
This package is a compilation of data surrounding the environment, behaviors, and human health for the continent of Africa by country. Currently, cross sectional data for 2016 is included in the AHE_master file. Future versions of the package will include panel data to aid the study of spatiotemporal changes across the continent. The objective of this data package is ultimately to submit the package to CRAN so the data is easily accessible for my future research in Africa as well as to motivate research for others interested in global health and environmental effects in Africa. 


### Data Description
The following varaibles are included in the master spatial data set:
* `Country`: full country name 
  * [(https://nowosad.github.io/spData/reference/world.html)](https://nowosad.github.io/spData/reference/world.html)
* `subregion`: region within the continent
  * [(https://nowosad.github.io/spData/reference/world.html)](https://nowosad.github.io/spData/reference/world.html).
* `areakm`: area of the country (km^2). [(https://nowosad.github.io/spData/reference/world.htm](https://nowosad.github.io/spData/reference/world.html).
* `isoa3`: Three letter country code
* `copd`: Age-standardized prevalence of COPD per 100,000 people
  * “Age-standardized Prevalence of Chronic Obstructive Pulmonary Disease per 100,000 People” 2016, Institute for Health Metrics and Evaluation (IHME). GBD Compare Data Visualization. [https://vizhub.healthdata.org/gbd-compare/](https://vizhub.healthdata.org/gbd-compare/)
* `lungc` Age-standardized prevalence of tracheal, bronchus, and lung cancer per 100,000 people
  * “Age-standardized Prevalence of Tracheal, Bronchus, and Lung Cancer per 100,000 People” 2016, Institute for Health Metrics and Evaluation (IHME). GBD Compare Data Visualization. [https://vizhub.healthdata.org/gbd-compare/](https://vizhub.healthdata.org/gbd-compare/).
* `pm25` Average annual population-weighted PM2.5 (ug/m^3)
  * “Average Population-Weighted PM2.5 (ug/m3)” 2019, State of Global Air. Health Effects Institute. [https://www.stateofglobalair.org/engage](https://www.stateofglobalair.org/engage).
* `co2` Average carbon dioxide (CO₂) emissions per capita (tonness per year)
  * “Per Capita CO2 Emissions (Global Carbon Project, Gapminder, UN)” 2016. Our World in Data. [https://ourworldindata.org/grapher/co-emissions-per-capita?tab=chart](https://ourworldindata.org/grapher/co-emissions-per-capita?tab=chart). 
* `water` Baseline water stress indicator value
  * "Aqueduct Global Maps 3.0 Data Country Rankings” 2019, World Resources Institute. [https://www.wri.org/applications/aqueduct/country-rankings/](https://www.wri.org/applications/aqueduct/country-rankings/). 
* `smoke` Prevalence of daily smoking in populations aged 10 and older (percent)
  * “Age-standardized Prevalence of Daily Smoking in Populations Aged 10 and Older (%) – Past, Unscaled” 2017, Global Burden of Disease Study. Our World in Data.[https://ourworldindata.org/grapher/prevalence-of-daily-smoking-sdgs](https://ourworldindata.org/grapher/prevalence-of-daily-smoking-sdgs).
* `sldfuel` Proportion of population using solid fuels
  * “Ambient Particulate Matter Pollution” 2019, State of Global Air 2019. Health Effects Institute. [https://www.stateofglobalair.org/engage](https://www.stateofglobalair.org/engage).
* `ozone` Average seasonal population-weighted ozone (ppb)
  * “Average Seasonal Population-Weighted Ozone (ppb)” 2019, State of Global Air 2019. Health Effects Institute. [https://www.stateofglobalair.org/engage](https://www.stateofglobalair.org/engage). 
* `pop` Total population count
  * “Population, Total”, 2016, The World Bank [https://data.worldbank.org/indicator/SP.POP.TOTL](https://data.worldbank.org/indicator/SP.POP.TOTL). 
* `urbpop` Urban population count
  * “Urban Population”, 2016, The World Bank. [https://data.worldbank.org/indicator/SP.URB.TOTL](https://data.worldbank.org/indicator/SP.URB.TOTL). 
* `perurb` Percent of the population living in an urban setting


### Notes on the data:
* Because Africa is a fairly information and resource poor continent, it is important to note that the prevalence values for the health are modeled estimates by the GBD and IHME studies. 
* For the same reason, subcountry level outcomes/ measures for many of these variables are not available. 
* The health health outcomes are reported as age-standardized rates in order to account for the varying age-structure of the populations in different countries, which allows for more accurate comparisons between countries. 


### Recommendations
* Add more data: 
  * If your check out Our World in Data and World Bank for more data at the country level for other variables of interest for your own analysis!
* Run regression:
  * If you would like to use this data to run regressions regressions, I recommend removing Western Sahara because there is very little data available for the country, and also Eritrea if the population size is a variable you plan to include because there is no population data. 
  * For spatial regressions, it may be beneficial to remove Madagascar if a contiguity based spatial weights matrix is required for your analysis.

  
### Future work:
* This data package will be used for my BA Thesis for Environmental and Urban Studies at the University of Chicago. My research goal, pending refinement, is to investigate to what extent are air quality and adverse health outcomes associated with lung cancer are spatially related throughout the continent of Africa in 2016.controlling for behavioral factors such as smoking and solid fuel use for cooking and heating, and for measures of vulnerability such as water stress. 
* More immediate work will be to clean and add panel data for the years 2000, 2005, 2010, and 2015 to the master dataset in order to run spatiotemporal regressions to better understand the relationship of the environment and health. 
* Following the inclusion of panel data and final edits, this package will be submitted to CRAN. 

 
If you are interested in seeing an application of the AHE master dataset, feel free to watch this [presentation](https://drive.google.com/open?id=1wtoZAnzZ5_Fm7Fl7rLkGFGQloOc81b23). 
  



  
  
  
  
  
