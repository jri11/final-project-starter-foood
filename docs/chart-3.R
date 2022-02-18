#Libraries Used
install.packages("dplyr")
library(dplyr)
install.packages("ggplot2")
library(ggplot2)

#Importing and reading the data files with the global food data (in kilograms), and global COVID-19 data 
food_global_data <- Food_Supply_Quantity_kg_Data
View(food_global_data)
#Grouping the Food Global Data by individual food categories(Meat)
obesity_deaths <- food_global_data %>%
  select(Obesity, Deaths)
View(obesity_deaths)
#Creating a histogram listing the global correlation between the percentage 
#of global obesity data and the percentages of deaths from COVID-19
ggplot(obesity_deaths, aes(x=Obesity, fill = Deaths)) + geom_histogram()

  
  