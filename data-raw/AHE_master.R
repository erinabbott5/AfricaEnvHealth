
# AHE_master data cleaning workflow
# by: Erin Abbott
# last edited: 06/14/20


# loading libraries
library(tidyverse)
library(sf)
library(spData)
library(spDataLarge)
library(dplyr)


# reading the data locally/ from spData
africa_shape <- world %>% filter(continent == "Africa", !is.na(iso_a2)) %>% dplyr::select(name_long, subregion, area_km2) %>% rename("Country" = "name_long") %>% filter(Country!="Madagascar")
africa_shape$Country <- gsub("eSwatini", "Swaziland", africa_shape$Country)
africa_shape$Country <- gsub("Côte d'Ivoire", "Cote d'Ivoire", africa_shape$Country)

health <- read.csv("health_africa.csv")
co2 <- read.csv("co2_percap.csv")
water <- read.csv("water_stress.csv")
smoking_prev <- read.csv("smoking_prev.csv")
ozone <- read.csv("ozone_avg.csv")
pm25 <- read.csv("pm25_avg.csv")
solid_fuel <- read.csv("solid_fuel.csv")
pop <- read.csv("pop.csv")
urban_pop <- read.csv("urban_pop.csv")


# cleaning the datasets (cross sectional 2016 data)
health_1 <- health %>% dplyr::select("Country", "iso_alpha3", "copd_prev_16", "lunc_prev_16") %>% filter(!is.na(copd_prev_16)) %>% rename("copd_16"="copd_prev_16", "lungc_16"="lunc_prev_16", "iso_a3"="iso_alpha3")
health_1$Country <- gsub("Republic of Congo", "Republic of the Congo", health_1$Country)
#write_csv(health_1, "health_data_clean.csv")

co2_1 <-co2 %>% filter(Year==2016) %>% rename("iso_a3" = "Code", "co2"="Per.capita.CO..emissions..tonnes.per.capita.") %>% dplyr::select("iso_a3", "co2")

water_1 <- water %>% dplyr::select("iso_a3", "score")

smoking_prev_1 <- smoking_prev %>% filter(Year== 2016) %>%  rename("iso_a3" = "Code") %>% rename(smoke_prev="Indicator.3.a.1..Age.standardised.prevalence.of.daily.smoking.in.populations.aged.10.and.older.......Past...Unscaled....") %>% select(iso_a3, "smoke_prev")

ozone_1 <- ozone %>% t %>% as.data.frame
names(ozone_1) <- ozone_1[1,]
ozone_1 <- ozone_1[-1,]
ozone_1<- ozone_1 %>% select("2016")
ozone_1 <- ozone_1 %>% rownames_to_column() %>% rename("ozone"="2016","Country"="rowname")
ozone_1$Country <- gsub("Burkina.Faso", "Burkina Faso", ozone_1$Country)
ozone_1$Country <- gsub("Cote.d.Ivoire", "Cote d'Ivoire", ozone_1$Country)
ozone_1$Country <- gsub("Congo", "Republic of the Congo", ozone_1$Country)
ozone_1$Country <- gsub("Democratic.Republic.of.the.Republic of the Congo", "Democratic Republic of the Congo", ozone_1$Country)
ozone_1$Country <- gsub("Central.African.Republic", "Central African Republic", ozone_1$Country)
ozone_1$Country <- gsub("Equatorial.Guinea", "Equatorial Guinea", ozone_1$Country)
ozone_1$Country <- gsub("South.Sudan", "South Sudan", ozone_1$Country)
ozone_1$Country <- gsub("The.Gambia", "The Gambia", ozone_1$Country)
ozone_1$Country <- gsub("Guinea.Bissau", "Guinea-Bissau", ozone_1$Country)
ozone_1$Country <- gsub("South.Africa", "South Africa", ozone_1$Country)
ozone_1$Country <- gsub("South.Sudan", "South Sudan", ozone_1$Country)
ozone_1$Country <- gsub("Sierra.Leone", "Sierra Leone", ozone_1$Country)

pm25_1 <- pm25 %>% t %>% as.data.frame
names(pm25_1) <- pm25_1[1,]
pm25_1 <- pm25_1[-1,]
pm25_1<- pm25_1 %>% dplyr::select("2016")
pm25_1 <- pm25_1 %>% rownames_to_column() %>% rename("pm25"="2016","Country"="rowname")
pm25_1$Country <- gsub("Burkina.Faso", "Burkina Faso", pm25_1$Country)
pm25_1$Country <- gsub("Cote.d.Ivoire", "Cote d'Ivoire", pm25_1$Country)
pm25_1$Country <- gsub("Congo", "Republic of the Congo", pm25_1$Country)
pm25_1$Country <- gsub("Democratic.Republic.of.the.Republic of the Congo", "Democratic Republic of the Congo", pm25_1$Country)
pm25_1$Country <- gsub("Central.African.Republic", "Central African Republic", pm25_1$Country)
pm25_1$Country <- gsub("Equatorial.Guinea", "Equatorial Guinea", pm25_1$Country)
pm25_1$Country <- gsub("South.Sudan", "South Sudan", pm25_1$Country)
pm25_1$Country <- gsub("The.Gambia", "The Gambia", pm25_1$Country)
pm25_1$Country <- gsub("Guinea.Bissau", "Guinea-Bissau", pm25_1$Country)
pm25_1$Country <- gsub("South.Africa", "South Africa", pm25_1$Country)
pm25_1$Country <- gsub("South.Sudan", "South Sudan", pm25_1$Country)
pm25_1$Country <- gsub("Sierra.Leone", "Sierra Leone", pm25_1$Country)

solid_fuel_1 <- solid_fuel %>% t %>% as.data.frame
names(solid_fuel_1) <- solid_fuel_1[1,]
solid_fuel_1 <- solid_fuel_1[-1,]
solid_fuel_1<- solid_fuel_1 %>% dplyr::select("2016")
solid_fuel_1 <- solid_fuel_1 %>% rownames_to_column() %>%  rename("solid"="2016","Country"="rowname") %>% mutate(solid_fuel= solid*100) %>% select("Country", "solid_fuel")
solid_fuel_1$Country <- gsub("Burkina.Faso", "Burkina Faso", solid_fuel_1$Country)
solid_fuel_1$Country <- gsub("Cote.d.Ivoire", "Cote d'Ivoire", solid_fuel_1$Country)
solid_fuel_1$Country <- gsub("Congo", "Republic of the Congo", solid_fuel_1$Country)
solid_fuel_1$Country <- gsub("Democratic.Republic.of.the.Republic of the Congo", "Democratic Republic of the Congo", solid_fuel_1$Country)
solid_fuel_1$Country <- gsub("Central.African.Republic", "Central African Republic", solid_fuel_1$Country)
solid_fuel_1$Country <- gsub("Equatorial.Guinea", "Equatorial Guinea", solid_fuel_1$Country)
solid_fuel_1$Country <- gsub("South.Sudan", "South Sudan", solid_fuel_1$Country)
solid_fuel_1$Country <- gsub("The.Gambia", "The Gambia", solid_fuel_1$Country)
solid_fuel_1$Country <- gsub("Guinea.Bissau", "Guinea-Bissau", solid_fuel_1$Country)
solid_fuel_1$Country <- gsub("South.Africa", "South Africa", solid_fuel_1$Country)
solid_fuel_1$Country <- gsub("South.Sudan", "South Sudan", solid_fuel_1$Country)
solid_fuel_1$Country <- gsub("Sierra.Leone", "Sierra Leone", solid_fuel_1$Country)

pop_1 <- pop %>% dplyr::select("Country.Name",  "X2016") %>% rename("Country" = "Country.Name",  "pop_16" = "X2016")
pop_1$Country <- gsub("Gambia, The", "The Gambia", pop_1$Country)
pop_1$Country <- gsub("Eswatini", "Swaziland", pop_1$Country)
pop_1$Country <- gsub("Congo, Dem. Rep.", "Democratic Republic of the Congo", pop_1$Country)
pop_1$Country <- gsub("Congo, Rep.", "Republic of the Congo", pop_1$Country)
pop_1$Country <- gsub("Egypt, Arab Rep.", "Egypt", pop_1$Country)

urban_pop_1 <- urban_pop %>% dplyr::select("Country.Name",  "X2016") %>% rename("Country" = "Country.Name",  "urban_16" = "X2016")
urban_pop_1$Country <- gsub("Gambia, The", "The Gambia", urban_pop_1$Country)
urban_pop_1$Country <- gsub("Eswatini", "Swaziland", urban_pop_1$Country)
urban_pop_1$Country <- gsub("Congo, Dem. Rep.", "Democratic Republic of the Congo", urban_pop_1$Country)
urban_pop_1$Country <- gsub("Congo, Rep.", "Republic of the Congo", urban_pop_1$Country)
urban_pop_1$Country <- gsub("Egypt, Arab Rep.", "Egypt", urban_pop_1$Country)


# merging to get master dataset

africa <- africa_shape
africa1 <- left_join(africa, health_1, by="Country" )
africa2 <- left_join(africa1, pm25_1, by="Country")
africa3 <- left_join(africa2, co2_1, by="iso_a3")
africa4 <- left_join(africa3, water_1, by="iso_a3")
africa5 <- left_join(africa4, smoking_prev_1, by="iso_a3")
africa6 <- left_join(africa5, solid_fuel_1, by="Country")
africa7 <- left_join(africa6, ozone_1, by="Country")
africa8 <- left_join(africa7, pop_1, by="Country")
africa9 <- left_join(africa8, urban_pop_1, by="Country")

africa10 <- africa9 %>% rename(areakm=area_km2, isoa3=iso_a3, copd=copd_16, lungc=lungc_16, pm25=pm25, pop=pop_16, urbpop=urban_16, water=score, smoke=smoke_prev, sldfuel = solid_fuel) %>% mutate(perurb = urbpop/pop*100)


# write master file
st_write(africa10, dsn = "AHE_master.shp", layer = "AHE_master.shp", driver = "ESRI Shapefile")
AHE_master <- st_read("AHE_master.shp")
save(AHE_master, file= "~/Desktop/Spring2020/GIS3Final/AfricaEnvHealth/data/AHE_master.rda")


# read and test master file
test <- get(load(file="~/Desktop/Spring2020/GIS3Final/AfricaEnvHealth/data/AHE_master.rda"))
plot(test)
class(test)
