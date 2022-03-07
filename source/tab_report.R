# Date: March 7th, 2022
# Author: Brendan Keane
# Purpose: Report tab for this user interface

# Libraries
library("shiny")

# Report tab
report_tab <- tabPanel(
  "Report",
  h1("Report"),
  p("  1 pt - For Project title; Authors; Affiliation; Date;
  Keywords."),
  p("  1 pt - Abstract"),
  p("  1 pt - Introduction "),
  p("  2 pt - Design situation "),
  p("  2 pt - Research questions "),
  p("  2 pt - Dataset "),
  p("  2 pts - Findings "),
  p("  2 pts - Discussion "),
  p("  2 pts - Conclusion")
)