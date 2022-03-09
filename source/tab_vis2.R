# Date: March 7th, 2022
# Author: Brendan Keane
# Purpose: Visualization tab for this user interface

# Libraries
library("shiny")
library(dplyr)


vis2_tab <- tabPanel(
  "Visualization 2",
  h1("Interactive Page 2"),
  plotOutput("veg_animal_covid")
  
)