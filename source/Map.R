county_united <- map_data("county") %>%
  unite(polyname, region, subregion, sep = ",")


data(county.fips)

county_shapes <- county_united  %>%
  left_join(county.fips, by="polyname")



map_data <- county_shapes %>%
  left_join(incarceration_data, by="fips")

map_data2 <- map_data %>% 
  filter(state == "WA")%>%
  filter(year == "2018")


blank_theme <- theme_bw() +
  theme(
    axis.line = element_blank(), # remove axis lines
    axis.text = element_blank(), # remove axis labels
    axis.ticks = element_blank(), # remove axis ticks
    axis.title = element_blank(), # remove axis titles
    plot.background = element_blank(), # remove gray background
    panel.grid.major = element_blank(), # remove major grid lines
    panel.grid.minor = element_blank(), # remove minor grid lines
    panel.border = element_blank() # remove border around plot
  )

incarceration_map <- ggplot(map_data2) + 
  geom_polygon(
    mapping = aes(x = long, y = lat, group = group, fill = total_jail_pop),
    color="gray", size = 0.3
  ) + 
  coord_map() + 
  scale_fill_continuous(limits = c(0, max(map_data2$total_jail_pop)), na.value = "white", low="yellow", high="red") + 
  blank_theme +
  ggtitle("Total Incarcerated in Washington in 2018")
print(incarceration_map)

