# Date: February 16th, 2022
# Author: Brendan Keane
# Purpose: Summarize information from the COVID-19 Healthy Diet Dataset

# Libraries used
library("dplyr")

# Loading global covid data
global_covid_data_origional <- read.csv("./data/jhu-covid19-2022-02-14.txt")

# Loading global food supply in kg
global_food_supply_kg_origional <- read.csv("./data/Food_Supply_Quantity_kg_Data.csv")

# Grouping information by country, removing unnecessary columns
global_covid_data <- global_covid_data_origional %>%
  group_by(Country_Region) %>%
  
  # Creating new columns that represent sums and averages for countries
  mutate(country_cases = sum(Confirmed, na.rm = TRUE)) %>%  # Sum of cases
  mutate(country_deaths = sum(Deaths, na.rm = TRUE)) %>%    # Sum of deaths
  mutate(country_lat = mean(Lat, na.rm = TRUE)) %>%         # Average latitude
  mutate(country_long = mean(Long_, na.rm = TRUE)) %>%      # Average longitude
  
  # Average incident rate and fatality ratio by country
  mutate(country_incident_rate = mean(Incident_Rate, na.rm = TRUE)) %>% 
  
  # Recalculating the fatality ratio with summarized cases and deaths by country
  mutate(country_fatality_ratio = country_deaths / country_cases) %>%
  
  # Grabbing the columns that are relevant to our further analysis
  select(Country_Region, country_lat, country_long, country_cases, 
         country_deaths, country_incident_rate, country_fatality_ratio, 
         Last_Update) %>%
  
  # Eliminate any duplicates
  unique()

# Altering the food data (measured as percentage of diet by mass) to be compatible
# with global COVID-19 dataframe
global_food_data_kg <- global_food_supply_kg_origional %>%
  select(-Confirmed, -Deaths, -Active, -Recovered, -Unit..all.except.Population.)


global_food_and_covid <- full_join(global_covid_data, global_food_data_kg, by = c("Country_Region" = "Country"))
