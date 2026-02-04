# Load Packages -----------------------------------------------------------

library(tidyverse)

# Import Data -------------------------------------------------------------

penguins <- read_csv("penguins.csv")

penguin_bill_length_by_island_and_sex <-
  penguins |>
  drop_na(sex) |>
  group_by(island, sex) |>
  summarize(mean_bill_length = mean(bill_length_mm))

# Themes ------------------------------------------------------------------

# To add a theme to a plot, we use the theme_ set of functions.
# There are several built-in themes. For instance, theme_minimal().

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
  theme_minimal()

# There's also theme_light().

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
  theme_light()

# There are also packages that give you themes you can apply to your plots.
# Let's load the ggthemes() package
# Install it if necessary using install.packages("ggthemes")

library(ggthemes)

# We can then use a theme from this package called theme_economist()
# to make our plots look like those in the Economist.

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
  theme_economist()

# You can see a number of other themes from this package at
# https://yutannihilation.github.io/allYourFigureAreBelongToUs/ggthemes/
