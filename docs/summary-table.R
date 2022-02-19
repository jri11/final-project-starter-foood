# Date: February 18th, 2022
# Author: Brendan Keane
# Purpose: Summarize information from COVID-19 and world food data

## Importing Data----------------

# Libraries used
library("dplyr")
library("knitr")

# Loading global COVID data
global_covid_data_origional <- read.csv("./data/jhu-covid19-2022-02-14.txt")

# Loading global food supply in kg
global_food_supply_kg_origional <- read.csv("./data/Food_Supply_Quantity_kg_Data.csv")

## Grouping and Summarizing ----
### Global COVID Data ------
global_covid_data <- global_covid_data_origional %>%
  # Group by country and filter for most recent information
  group_by(Country_Region) %>%
  filter(Last_Update == max(Last_Update, na.rm = TRUE)) %>%
  
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
 
  # Eliminating any duplicate information
  unique()

### Global Food Data -----
# Altering the food data (measured as percentage of diet by mass) to be compatible
# with global COVID-19 data frame
global_food_data_kg <- global_food_supply_kg_origional %>%
  select(-Confirmed, -Deaths, -Active, -Recovered, -Unit..all.except.Population.)

## Cleaning Data: Matching Country Names ----------
# Before computing summary statistics, we need to adjust naming conventions
# to match the food data

# Laos / Lao People's Democratic Republic
global_food_data_kg[global_food_data_kg$Country == 
                      "Lao People's Democratic Republic", "Country"] <- "Laos"

# Congo / Congo (Brazzaville) / Congo (Kinshasa)
global_covid_data[global_covid_data$Country_Region == "Congo (Brazzaville)"
                  , "Country_Region"] <- "Congo"
global_covid_data[global_covid_data$Country_Region == "Congo (Kinshasa)"
                  , "Country_Region"] <- "Congo"

# Iran / Iran (Islamic Republic of)
global_food_data_kg[global_food_data_kg$Country == 
                      "Iran (Islamic Republic of)", "Country"] <- "Iran"

# Myanmar / Burma
global_covid_data[global_covid_data$Country_Region == "Burma"
                  , "Country_Region"] <- "Myanmar"

# Moldova / Republic of Moldova
global_food_data_kg[global_food_data_kg$Country == 
                      "Republic of Moldova", "Country"] <- "Moldova"

# Russia / Russian Federation
global_food_data_kg[global_food_data_kg$Country == 
                      "Russian Federation", "Country"] <- "Russia"

# Tanzania / United Republic of Tanzania
global_food_data_kg[global_food_data_kg$Country == 
                      "United Republic of Tanzania", "Country"] <- "Tanzania"

# United States of America / US
global_covid_data[global_covid_data$Country_Region == "US"
                  , "Country_Region"] <- "United States of America"

# Venezuela / Venezuela (Bolivarian Republic of)
global_food_data_kg[global_food_data_kg$Country == 
                      "Venezuela (Bolivarian Republic of)", "Country"] <- "Venezuela"

## Combining both data frames -----------
# Combining both of the data frames
global_food_and_covid <- inner_join(global_covid_data, global_food_data_kg, 
                                   by = c("Country_Region" = "Country"))


## Summary table ------
# Saving the dataframe as a csv
write.csv(global_food_and_covid,"./data/global_food_and_covid.csv", row.names = FALSE)

# Creating a summary table from our full data frame
simple_food_and_covid <- global_food_and_covid %>%
  select(Country_Region, Population, country_cases, country_deaths, 
         country_fatality_ratio, Obesity, Undernourished, Animal.Products, 
         Vegetal.Products) %>%
  rename("Country" = Country_Region, "Cases" = country_cases, 
         "Deaths" = country_deaths, "Fatality Ratio (Deaths to Cases)" = country_fatality_ratio,
         "Obesity (%)" = Obesity, "Malnourished (%)" = Undernourished,
         "Animal Producs (kg)" = Animal.Products, 
         "Vegetable Products (kg)" = Vegetal.Products) %>%
  arrange(-Population) %>%
  head(15)

summary_table <- kable(simple_food_and_covid, format = "pipe", digits = 3)
