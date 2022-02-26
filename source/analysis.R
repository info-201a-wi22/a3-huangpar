library("dplyr")
library("tidyr")
data <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv")

incarceration_data <- data%>%
  filter(state == "WA")

incarceration_totals <- incarceration_data%>%
  group_by(year)%>%
  summarise(total_jail_pop = sum(total_jail_pop, na.rm = TRUE))
            
jail_totals <- incarceration_data %>% 
  group_by(year)%>%
  summarise (black_jail_pop = sum(black_jail_pop, na.rm = TRUE),
             white_jail_pop = sum(white_jail_pop, na.rm = TRUE),
             aapi_jail_pop = sum(aapi_jail_pop, na.rm = TRUE),
             native_jail_pop = sum(native_jail_pop, na.rm = TRUE),
             latinx_jail_pop = sum(latinx_jail_pop, na.rm = TRUE),
             other_race_jail_pop = sum(other_race_jail_pop, na.rm = TRUE))%>%
  pivot_longer(incarceration_totals, cols=2:7, names_to = "race", values_to = "total_incarcerated")
  
 
  
  