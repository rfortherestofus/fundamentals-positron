# Load Packages -----------------------------------------------------------

library(tidyverse)

# Import Data -------------------------------------------------------------

penguins <- read_csv("penguins.csv")

penguin_bill_length_by_island_and_sex <-
  penguins |>
  drop_na(sex) |>
  group_by(island, sex) |>
  summarize(mean_bill_length = mean(bill_length_mm))

# Facets ------------------------------------------------------------------

# One of the most powerful features of ggplot is facetting.
# You can make small multiples by adding just a line of code.

# The facet_wrap() function will create small multiples.

ggplot(
  data = penguin_bill_length_by_island_and_sex,
  mapping = aes(x = island, y = mean_bill_length, fill = sex)
) +
  geom_col(position = "dodge") +
  labs(
    title = "Males have longer bills than females",
    subtitle = "But they're all good penguins",
    caption = "Data from the palmerpenguins R package",
    x = NULL,
    y = "Mean Bill Length in Millimeters",
    fill = NULL
  ) +
  theme_economist() +
  facet_wrap(vars(sex))

# You can do something similar with the facet_grid() function.
# With this function, you can specify whether you want the facetting
# on rows or columns.

# This is identical to the facet_wrap() above.

ggplot(
  data = penguin_bill_length_by_island_and_sex,
  mapping = aes(
    x = island,
    y = mean_bill_length,
    fill = sex
  )
) +
  geom_col(position = "dodge") +
  labs(
    title = "Males have longer bills than females",
    subtitle = "But they're all good penguins",
    caption = "Data from the palmerpenguins R package",
    x = NULL,
    y = "Mean Bill Length in Millimeters",
    fill = NULL
  ) +
  theme_economist() +
  facet_grid(cols = vars(sex))

# This puts the result in two rows.

ggplot(
  data = penguin_bill_length_by_island_and_sex,
  mapping = aes(
    x = island,
    y = mean_bill_length,
    fill = sex
  )
) +
  geom_col(position = "dodge") +
  labs(
    title = "Males have longer bills than females",
    subtitle = "But they're all good penguins",
    caption = "Data from the palmerpenguins R package",
    x = NULL,
    y = "Mean Bill Length in Millimeters",
    fill = NULL
  ) +
  theme_economist() +
  facet_grid(rows = vars(sex))

# We can use facetting for any type of figure.
# Here's our scatterplot from before with a theme and
# facetting by sex added

ggplot(
  data = penguins,
  mapping = aes(
    x = bill_length_mm,
    y = bill_depth_mm
  )
) +
  geom_point() +
  theme_economist() +
  facet_grid(cols = vars(sex))

# You can even use multiple variables with facet_grid().

ggplot(
  data = penguins,
  mapping = aes(
    x = bill_length_mm,
    y = bill_depth_mm
  )
) +
  geom_point() +
  theme_economist() +
  facet_grid(rows = vars(year), cols = vars(sex))
