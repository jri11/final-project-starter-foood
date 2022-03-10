# Date: March 7th, 2022
# Author: Brendan Keane
# Purpose: Visualization tab for this user interface

# Libraries
library("shiny")
library("dplyr")

food_and_covid <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-foood/main/data/global_food_and_covid.csv")

# UI for this tab
vis1_tab <- tabPanel(
  "Visualization 1",
  h1("Interactive Page 1"),
  plotOutput("lethal_foods"),
  p("Alcohol is generally to be consumed in moderation, and copious amount is
     not healthy for anyone, however since alcohol has this unhealthy reputation,
     it would be easy to assume that people who consume more alcohol are more
     susceptible to COVID-19 exposure. Contradictaory to this misconception,
     the data we explored, shows no clear pattern of alcohol consumption and fatality.
     In addition, It appears as though even if the alcoholic beverage consumption
     is over fifteen, there is no correleation with the fatality ratio. This
     does not mean that alcohol actually helps with the immune system avioding 
     COVID, but it does not have any clear data/patterns that it hurts either.
     The data also shows other things that could be included in alcohol such as 
     sugars and stimulants."),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "bar",
                  label = "Category",
                  choices = list(
                    "Alcoholic Beverages"= food_and_covid$Alcoholic.Beverages,
                    "Stimulants" = food_and_covid$Stimulants,
                    "Sugars and Sweetners" = food_and_covid$Sugars_Sweeteners,
                  ),
                  selected = "Alcoholic Beverages")
    ),
    mainPanel(
      plotlyOutput("chart1"),
    )

)
)
