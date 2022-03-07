# Date: March 7th, 2022
# Author: Brendan Keane
# Purpose: Visualization tab for this user interface

# Libraries
library("shiny")

# UI for this tab
vis3_tab <- tabPanel(
  "Visualization 3",
  h1("Interactive Page 3"),
  p("Creates a well laid out page with a set of 1+ controls that configure a 
    chart. Chart must be intentionally designed to reveal particular patterns in 
    the data, and meet course standards of labeling // clarity."),
  p("(2pts) A description of what the chart attempts to answer/understand"),
  p("(4pts) Selected the appropriate chart type / graphical encoding based on 
    the question of interest and the data type(s) of the features"),
  p("(4pts) Appropriate labels/legends, depending on your chart type. Including, 
  but not limited to: - X axis label (if there's an x axis) - Y axis label (if 
  there's an y axis) - Title (if there's an ability to add a title -- e.g., not 
  a map) - Legend for any encodings that are not immediately apparent"),
  p("(2pts) Provides well-formatted and detailed information when hovering each 
    mark on the chart"),
  p("(2pts) for creating at least 1 widget with appropriate label"),
  p("(1pt) for setting appropriate default value"),
  p("(3pts) for the widget working (e.g., changing the desired output)"),
  p("(2pts) for appropriate layout of controls and visualization (e.g., a 
    sidebarLayout())")
)