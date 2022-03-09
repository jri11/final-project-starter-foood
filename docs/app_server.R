# Date: March 7th, 2022
# Author: Brendan Keane
# Purpose: Server for INFO 201 final deliverable

# Libraries
library("shiny")
setwd("/Users/jibson/Desktop/info201/final-project-starter-foood")
#load the package
library(ggplot2)
library(dplyr)
library(leaflet)
library("plotly")

# Prepares for the server
food_and_covid <- read.csv("./data/global_food_and_covid.csv")
covid_specific <- food_and_covid %>%
  select(Country_Region, country_deaths, country_cases, country_fatality_ratio)
food_and_covid_new <- food_and_covid%>%
  rename("Cases" = "country_cases",
         "Deaths" = "country_deaths")
Country_Region <- food_and_covid_new$Country_Region

# Server
server <- function(input, output) {
  output$chart2 <- renderPlotly({
    covid_plot<-ggplot(data=food_and_covid_new) +
      geom_col(mapping=aes(
        x=Cases,
        y=!!as.name(input$bar)))+
      labs(title="A3", x="Cases", y="Deaths")
    return(ggplotly(covid_plot))
  })
}
    
    
    
    
    
    
    
    #filter_co2_new_2<-filter_co2 %>% 
      #filter(year>=input$Year[1],year<=input$Year[2])
    #
    #co2_plot<-ggplot(data=filter_co2_new_2) +
    #  geom_line(mapping=aes(
     #   x=year,
      #  y=!!as.name(input$linevar)),color = "steelblue")+
     # labs(title="Trends in CO2 emissions of selected type over year", x="Year", y="CO2 emission amount")
   # return(ggplotly(co2_plot))
 # })
#}
