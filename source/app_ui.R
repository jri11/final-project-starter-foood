# Date: March 7th, 2022
# Author: Brendan Keane
# Purpose: User interface for INFO 201 final deliverable

# Libraries
library("leaflet")
library("shiny")
library("plotly")

# Source Files
source("../source/tab_intro.R")
source("../source/tab_vis1.R")
source("../source/tab_vis2.R")
source("../source/tab_vis3.R")
source("../source/tab_vis4.R")
source("../source/tab_report.R")

# Full ui
ui <- fluidPage(
  navbarPage(
    "Dietary Health and COVID Mortality",
    intro_tab,
    vis1_tab,
    vis2_tab,
    vis3_tab,
    vis4_tab,
    report_tab
  )
)

