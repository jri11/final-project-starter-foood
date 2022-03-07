# Date: March 7th, 2022
# Author: Brendan Keane
# Purpose: Introduction tab for this user interface

# Libraries
library("shiny")

# Intro tab
intro_tab <- tabPanel(
  "Introduction",
  h1("Introductary Page"),
  p("Clearly introduces the purpose of the project (i.e., questions it seeks 
    to answer) and what datasets it will use to do so. Some visual flare (e.g., background image) is present."),
  p("(3pts) The purpose/importance of the project"),
  p("(2pts) Page includes additional (relevant) visual flare beyond the summary paragraph")
)
