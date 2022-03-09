# Date: March 7th, 2022
# Author: Brendan Keane
# Purpose: User interface for INFO 201 final deliverable

<<<<<<< HEAD
=======
# setwd("/Users/jibson/Desktop/info201/final-project-starter-foood/source")
>>>>>>> 065b9296bd5c1280d0a4e946b1b4e90f8a249a2c
# Libraries

library("leaflet")
library("shiny")
library("plotly")
library("shinythemes")

# Source Files
source("../source/tab_intro.R")
source("../source/tab_vis1.R")
source("../source/tab_vis2.R")
source("../source/tab_vis3.R")
source("../source/tab_vis4.R")
source("../source/tab_report.R")

# Full ui
ui <- fluidPage(
  theme = shinytheme("cyborg"),
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
