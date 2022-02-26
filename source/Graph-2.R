incarceration_scatter <- ggplot(incarceration_totals, aes(year, total_jail_pop)) + geom_point() +
  labs(x = "Year", y = "Total People Incarcerated", title = "Total People Incarcerated",
       subtitle = "Total People Incarcerated in Washington, Divided up by Race")
print(incarceration_scatter)
