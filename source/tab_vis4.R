# Date: March 7th, 2022
# Author: Brendan Keane
# Purpose: Visualization tab for this user interface

# Libraries
library("shiny")
library("leaflet")

# Controls
sidepanel <- sidebarPanel(
  selectInput(
    inputId = "food_cat",
    label = "Food Group",
    choices = list("Vegetable Products" = "Vegetal.Products",
                   "Animal Products" = "Animal.Products",
                   "Animal Fats" = "Animal.fats",
                   "Sugars and Sweeteners" = "Sugar...Sweeteners",
                   "Legumes (Beans, Chickpeas, Lentils, etc)" = "Pulses",
                   "Cereals" = "Cereals...Excluding.Beer"),
    selected = "Vegetal.Products"
  )
)

# Visualization
mainpanel <- mainPanel(
  leafletOutput("foodMap"),
  p(""),
  p("COVID-19 mortality rate modeled in RED"),
  p("Food group consumption per capita modeled in GREEN")
)

# UI for this tab
vis4_tab <- tabPanel(
  "Food Map",
  sidebarLayout(
    sidepanel,
    mainpanel
  )
)