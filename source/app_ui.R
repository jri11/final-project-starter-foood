# Date: March 7th, 2022
# Author: Brendan Keane
# Purpose: User interface for INFO 201 final deliverable

# Libraries
library("rsconnect")
library("dplyr")
library("rgeos")
library("rworldmap")
library("tidyr")
library("ggplot2")
library("plotly")
library("shinythemes")

# Source Files
source("tab_intro.R")
source("tab_vis1.R")
source("tab_vis2.R")
source("tab_vis3.R")
source("tab_vis4.R")
source("tab_report.R")

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

