setwd("/Users/jibson/Desktop/info201/final-project-starter-foood")
#load the package
library(ggplot2)
library(dplyr)
library(leaflet)
library("plotly")

#cases and deaths condition in US(scatter plot)
food_and_covid <- read.csv("./data/global_food_and_covid.csv")
covid_specific <- food_and_covid %>%
  select(Country_Region, country_deaths, country_cases, country_fatality_ratio)

chart2 <- plot_ly(
  data = covid_specific, 
  x = ~country_cases, 
  y = ~country_deaths,
  size = ~country_deaths,
  type="scatter"
) %>% layout(title = "COVID-19 Mortality Ratio", 
             xaxis = list(range = c(log10(1000), log10(125000000)), title = "Cases", type = "log"), 
             yaxis = list(title = "Deaths", type = "log")) %>%
  add_trace(
    text = ~Country_Region,
    hoverinfo = c("text"),
    showlegend = F
  )

chart2


