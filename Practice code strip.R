library(tidyverse)

# read the data in and left assign it.

data <- read_csv("sample-data.csv") %>% 
  filter(complete.cases(.))

# create a tibble thats two rows and three columns

data1 <- data %>% 
  select(species, height) %>% 
  filter(species != "C")

# create a tibble with mean and SE for species A and B

data1 %>% 
  group_by(species) %>% 
  summarise(mean = mean(height, na.rm = TRUE),
            standard_error = sd(height, na.rm = TRUE)/sqrt(32))

# tibble with species and height
data2 <-data %>% 
  select(species, height)

#histogram of heights and species
data2 %>% 
  group_by(species) %>% 
  ggplot(aes(height)) +
  geom_histogram(binwidth = 2) 
  facet_grid(~species)
  
# tibble with heights weights and species
  data3 <- data %>% 
    select(species, height, weight)
  
# scatterplot of heights and weights
  data31 <- data3 %>% 
    group_by(species) %>% ggplot(aes(height)) +
    geom_point(na.rm = TRUE, aes(height, weight, color = species))
