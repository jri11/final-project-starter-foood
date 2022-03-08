# Date: March 7th, 2022
# Author: Brendan Keane
# Purpose: Visualization tab for this user interface

# Libraries
library("shiny")

# Controls
sidepanel <- sidebarPanel(
  h1("Test space")
)

# Visualization
mainpanel <- mainPanel(
  h1("Changing space")
)

# UI for this tab
vis4_tab <- tabPanel(
  "Visualization 4",
  sidebarLayout(
    sidepanel,
    mainpanel
  )
)