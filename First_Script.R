#Test push
print("Hello World!")

library(tidyverse)

golfdf <- read_csv("Golf_Data.csv")

golfdf <- golfdf[-181, ]

gdf1 <- golfdf %>% 
  group_by(Date, Course) %>% 
  summarise(
    total_score = sum(Score),
    total_par = sum(Par)
  ) %>% 
  mutate(
    to_par = total_score - total_par,
    Date = mdy(Date)
  )

ggplot(gdf1, aes(x = Date, y = to_par)) +
  geom_line() +
  geom_point() +
  theme_bw()
