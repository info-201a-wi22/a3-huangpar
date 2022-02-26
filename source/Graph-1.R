incarceration_line <- ggplot(jail_totals, aes(year, total_incarcerated, color = race)) + geom_line() +
  labs(x = "Year", y = "Total People Incarcerated", title = "Total People Incarcerated",
       subtitle = "Total People Incarcerated in Washington, Divided up by Race")

