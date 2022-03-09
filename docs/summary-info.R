# Date: February 18th, 2022
# Author: Brendan Keane
# Purpose: Calculate 5 Important Summary Values

# Importing relevant libraries
library("dplyr")

# Creating a data frame from our cleaned data
global_food_and_covid <- read.csv("./data/global_food_and_covid.csv")

# Number of countries represented
num_countries <- global_food_and_covid %>%
  select(Country_Region) %>%
  nrow()

# Number of people represented
num_people <- global_food_and_covid %>%
  select(Population) %>%
  sum()

# Top 10 highest death rate countries
ten_highest_death_rate <- global_food_and_covid %>%
  arrange(-country_fatality_ratio) %>%
  head(10) %>%
  select(Country_Region, country_fatality_ratio)

# Mean and Median death rate
median_death_rate <- median(global_food_and_covid$country_fatality_ratio, na.rm = TRUE)
mean_death_rate <- mean(global_food_and_covid$country_fatality_ratio, na.rm = TRUE)


# Top 10 highest obesity rate countries
ten_highest_obesity_rate <- global_food_and_covid %>%
  arrange(-Obesity) %>%
  head(10) %>%
  select(Country_Region, Obesity)

# Median obesity rate
median_obesity_rate <- median(global_food_and_covid$Obesity, na.rm = TRUE)
mean_obesity_rate <- mean(global_food_and_covid$Obesity, na.rm = TRUE)

# List of summary statistics
summary_info <- list()
summary_info$num_countries <- num_countries
summary_info$num_people <- num_people
summary_info$ten_highest_death_rate <- ten_highest_death_rate
summary_info$median_death_rate <- median_death_rate
summary_info$mean_death_rate <- mean_death_rate
summary_info$ten_highest_obesity_rate <- ten_highest_obesity_rate
summary_info$median_obesity_rate <- median_obesity_rate
summary_info$mean_obesity_rate <- mean_obesity_rate

print(summary_info)
