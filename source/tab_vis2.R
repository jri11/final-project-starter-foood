# Date: March 7th, 2022
# Author: Brendan Keane
# Purpose: Visualization tab for this user interface

# Libraries
library("shiny")
library(dplyr)

# Prepare for the data
food_and_covid <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-foood/main/data/global_food_and_covid.csv")
food_and_covid_new <- food_and_covid%>%
  rename("Cases" = "country_cases",
         "Deaths" = "country_deaths")
Country_Region <- food_and_covid_new$Country_Region


vis2_tab <- tabPanel(
  "Visualization 2",
  h1("Interactive Page 2"),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "bar",
                  label = "Country",
                  choices = list(
                    "Country"=Country_Region
                    ),
                  selected = "United States of America"),
    ),
    mainPanel(
      plotlyOutput("chart2"),
    )
  ),
  widths = c(2,12),
  p("Creates a well laid out page with a set of 1+ controls that configure a 
    #chart. Chart must be intentionally designed to reveal particular patterns in 
    #the data, and meet course standards of labeling // clarity."),
  p("The purpose of this chart is to explore the relationship between the number of cases and deaths across countries and to derive their ratios. In addition, another aspect is to calculate the ratio between them and explore the relationship between the ratio and the ratio of nutritious food intake."),
  p("(4pts) Selected the appropriate chart type / graphical encoding based on 
   the question of interest and the data type(s) of the features"),
  p("(4pts) Appropriate labels/legends, depending on your chart type. Including, 
  but not limited to: - X axis label (if there's an x axis) - Y axis label (if 
  there's an y axis) - Title (if there's an ability to add a title -- e.g., not 
  a map) - Legend for any encodings that are not immediately apparent"),
  p("(2pts) Provides well-formatted and detailed information when hovering each 
    #mark on the chart"),
  p("(2pts) for creating at least 1 widget with appropriate label"),
  p("(1pt) for setting appropriate default value"),
  p("(3pts) for the widget working (e.g., changing the desired output)"),
  p("(2pts) for appropriate layout of controls and visualization (e.g., a 
    sidebarLayout())")
)

