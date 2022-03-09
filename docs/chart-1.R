#Libraries used
install.packages("dplyr")
library("dplyr")
install.packages ("ggplot2")
library("ggplot2")

#Importing and reading the data files with the global food data (in kilograms), and global COVID data 
global_food_data <- read.csv("./data/global_food_and_covid.csv")

#Grouping Food Supply data set by food category(sweeteners)
food_supply_quantity_kg_data <- global_food_data %>%
  group_by(Sugar...Sweeteners) %>%
  filter(Last_Update == max(Last_Update, na.rm = TRUE))
  
#creating a density map exemplifying the correlation between the percentage 
#cd ~of global sugar consumption and the percentages of deaths from COVID 
food_supply_quantity_kg_data %>%
  ggplot(., aes(x = Sugar...Sweeteners, fill = country_deaths)) +
  geom_density()
  
