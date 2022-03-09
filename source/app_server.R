# Date: March 7th, 2022
# Author: Brendan Keane
# Purpose: Server for INFO 201 final deliverable

# Libraries

library("shiny")
library(ggplot2)
library(dplyr)
library(leaflet)
library("plotly")
library(knitr)
library(kableExtra)
library(htmltools)
library(tidyverse)
library(scales)
library(ExPanDaR)

# Source files
source("../source/data_access.R")


# Prepares for the server
food_and_covid <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-foood/main/data/global_food_and_covid.csv")
covid_specific <- food_and_covid %>%
  select(Country_Region, country_deaths, country_cases, country_fatality_ratio)
food_and_covid_new <- food_and_covid%>%
  rename("Cases" = "country_cases",
         "Deaths" = "country_deaths")
Country_Region <- food_and_covid_new$Country_Region

# Server
    
    
    
    
    
    
    
  
  #Visualization 2 
  #scatter plot 
  df <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-foood/main/data/global_food_and_covid.csv")
  df <- df[, c("country_cases", "country_deaths", "Alcoholic.Beverages", "Last_Update", "Population")]
  df <- df[complete.cases(df), ]
  output$chart2 <- renderPlotly({
    prepare_scatter_plot(df, "country_deaths", "Alcoholic.Beverages", color = "Last_Update", size = "Population", loess = 1)
  })
  
  #Visualization 3
  #bar chart
  # Prepares for the server
server <- function(input, output) {
  food_and_covid <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-foood/main/data/global_food_and_covid.csv")
  covid_specific <- food_and_covid %>%
    select(Country_Region, country_deaths, country_cases, country_fatality_ratio)
  food_and_covid_new <- food_and_covid%>%
    rename("Cases" = "country_cases",
           "Deaths" = "country_deaths")
  Country_Region <- food_and_covid_new$Country_Region
  food_and_covid_new_1<-  food_and_covid_new%>%
    group_by(Country_Region)%>%
    summarise(Country_Region,Cases,Deaths) %>%
    slice_max(order_by =Cases , n = 5)%>%
    pivot_longer(c(Cases,Deaths), names_to = "type", values_to = "population")
  
  # Server
    data<-reactive({
      food_and_covid_new_1[food_and_covid_new_1$Country_Region == input$bar,]
    })
    output$chart2 <- renderPlotly({
      ggplot(
        data = data(),
        mapping = aes(x = input$bar, y = population, group = type, fill = type)
      ) +
        geom_col(position = "dodge",width=0.3)+
        labs(x="Country", y="the number of people",title = "Covid Cases and Deaths in each country")
    })
  
  
  
  
  # Visualization 4
  # Interactive map
  output$foodMap <- renderLeaflet({
    
    factor <- input$food_cat
    
    map_vis <- norm_foodcovid_data %>%
      rename(rad = factor)
    
    leaflet() %>%
      addProviderTiles("CartoDB.Positron") %>%
      setView(lng = 0, lat = 20, zoom = 2) %>%
      addCircleMarkers(
        lat = map_vis$country_lat,
        lng = map_vis$country_long, 
        radius = 25 * map_vis$rad,
        popup = paste(map_vis$Country_Region, "| Normalized Food Factor: ", round(map_vis$rad, 5)),
        color = "#0F9458",
        opacity = 1,
        stroke = FALSE
      ) %>%
      addCircleMarkers(
        lat = map_vis$country_lat,
        lng = map_vis$country_long, 
        radius = 25 * map_vis$fatality_ratio_norm,
        popup = paste(map_vis$Country_Region, "| Fatality Ratio: ", round(map_vis$country_fatality_ratio, 5)),
        color = "#E00064",
        opacity = 1,
        stroke = FALSE
      )
  })
}

  