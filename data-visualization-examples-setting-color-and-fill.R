# Load Packages -----------------------------------------------------------

library(tidyverse)

# Import Data -------------------------------------------------------------

penguins <- read_csv("penguins.csv")

penguin_bill_length_by_island <-
  penguins |>
  group_by(island) |>
  summarize(mean_bill_length = mean(bill_length_mm, na.rm = TRUE)) |>
  arrange(mean_bill_length)

# Setting color and fill Aesthetic Properties -----------------------------

# We add the color argument within aes() so that
# the data in that variable is mapped to those aesthetic properties.

# With this code, the island variable is mapped to the aesthetic property color

ggplot(
  data = penguins,
  mapping = aes(
    x = bill_length_mm,
    y = bill_depth_mm,
    color = island
  )
) +
  geom_point()

# Let's try the same thing with our bar chart

ggplot(
  data = penguin_bill_length_by_island,
  mapping = aes(
    x = island,
    y = mean_bill_length,
    color = island
  )
) +
  geom_col()

# That didn't work! Let's try fill instead.

ggplot(
  data = penguin_bill_length_by_island,
  mapping = aes(
    x = island,
    y = mean_bill_length,
    fill = island
  )
) +
  geom_col()
