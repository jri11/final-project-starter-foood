# Date: March 7th, 2022
# Author: Brendan Keane
# Purpose: Introduction tab for this user interface

# Libraries
library("shiny")

# Intro tab
intro_tab <- tabPanel(
  "Introduction",
  h1("Introductary Page"),
  h4("Within this data analysis of COVID-19 and macronutrient consumption, we can 
     explore the effects of food on our immune system and susceptibility to viruses.
     Through viewing the relationship of COVID-19 and food groups like dairy, for 
     example, we can easily see patterns emerge and adjust our own diets to 
     contribute to a helatheir society free of COVID-19. This analysis seeks to 
     visualize and comminicate where exactly in our lives we can take small steps 
     towards eradicating COVID-19 and improving our immunity.")
)

