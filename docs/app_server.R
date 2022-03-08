# Date: March 7th, 2022
# Author: Brendan Keane
# Purpose: Server for INFO 201 final deliverable

# Libraries
library("shiny")

# Source files
source("../source/data_access.R")

server <- function(input, output) {
  
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