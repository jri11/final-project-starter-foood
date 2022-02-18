#Libraries used
install.packages("dplyr")
library("dplyr")
install.packages ("ggplot2")
library("ggplot2")

#Importing and reading the data files with the global food data (in kilograms), and global COVID data 
Global_Food_Data <- read.csv(".\\final-project-starter-foood\\data\\Food_Supply_Quantity_kg_Data.csv")

#Grouping Food Supply data set by food category(sweeteners)
Global_Food_Data <- Food_Supply_Quantity_kg_Data %>%
group_by(Sugar...Sweeteners) %>%
  filter(Last_Update == max(Last_Update, na.rm = TRUE)) %>%
  
#creating a density map exemplifying the correlation between the percentage 
#of global sugar consumption and the percentages of deaths from COVID 
Global_Food_Data %>%
  ggplot(., aes(x = Sugar...Sweeteners, fill = Deaths)) +
  geom_density()
  
