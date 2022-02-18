#set working directory
setwd("/Users/jibson/Desktop/info201/final-project-starter-foood")

#load the package
library(ggplot2)
library(dplyr)
library(leaflet)
library("plotly")

#cases and deaths condition in US(scatter plot)
food_quantity <- read.csv("./data/Food_Supply_Quantity_kg_Data.csv",stringsAsFactors = FALSE)
Covid <- read.csv("./data/jhu-covid19-2022-02-14.txt",stringsAsFactors = FALSE)
covid_specific <- Covid %>%
  mutate(deathratio=Deaths/Confirmed)%>%
  filter(
    Confirmed>Deaths,
    Last_Update == "2022-02-15 04:21:09"
  )

case_deaths<-ggplot(data = covid_specific) +
  geom_point(mapping = aes(x = Confirmed, y = Deaths, color = deathratio ),position = "jitter",alpha=0.3)+
  geom_smooth(mapping = aes(x = Confirmed, y = Deaths, color = deathratio), se = FALSE)+
  scale_x_log10()+
  scale_y_log10()

case_deaths <- plot_ly(
  data = covid_specific, 
  x = ~Confirmed, 
  y = ~Deaths, 
  color =~deathratio,
  size = ~Deaths/20,
  type="scatter"
)

case_deaths <- case_deaths %>% 
  layout(
  title = "Cases and Deaths condition around the world(recently updated)",
  xaxis = list(title = "The number of cases"),
  yaxis = list(title = "The number of deaths ")
)






