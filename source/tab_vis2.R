# Date: March 7th, 2022
# Author: Brendan Keane
# Purpose: Visualization tab for this user interface

# Libraries
library("shiny")
library(dplyr)


vis2_tab <- tabPanel(
  "Visualization 2",
  h1("Animal and Vegetable Consumption in Relation to Covid Deaths"),
  plotOutput("veg_animal_covid"),
  p("The purpose of this chart is to explore the relationship between the consumption of Animal and Vegetable products, along with viewing 
  the ratio of covid-19 mortality rates. Finland has the largest ratio of animal product to plant product, almost equal to 1, nigeria has the 
    smallest ratio of animal products to plant products, and the difference between animal products and plant products is almost 40 times. According to the research and the questions we answered (animal products in developed countries are high), it can be concluded that the national development of nigeria is not Good, so there is no strong immunity against COVID.  ")
  
)