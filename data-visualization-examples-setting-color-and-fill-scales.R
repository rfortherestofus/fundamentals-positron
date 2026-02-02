# Load Packages -----------------------------------------------------------

library(tidyverse)

# Import Data -------------------------------------------------------------

penguins <- read_csv("penguins.csv")

penguin_bill_length_by_island <-
  penguins |>
  group_by(island) |>
  summarize(mean_bill_length = mean(bill_length_mm, na.rm = TRUE)) |>
  arrange(mean_bill_length)

# Setting color and fill Scales -------------------------------------------

# We can change the color or fill scale using a scale function.

# The function scale_color_manual() allows us to manually specify colors to use.

ggplot(
  data = penguins,
  mapping = aes(
    x = bill_length_mm,
    y = bill_depth_mm,
    color = island
  )
) +
  geom_point() +
  scale_color_manual(
    values = c(
      "orange",
      "dodgerblue",
      "green"
    )
  )

# We can also use built-in palettes.

# The scale_color_viridis_d() function (the d means it works with discrete data)
# is a great way to get colorblind-friendly palettes.

ggplot(
  data = penguins,
  mapping = aes(
    x = bill_length_mm,
    y = bill_depth_mm,
    color = island
  )
) +
  geom_point() +
  scale_color_viridis_d()

# The scale_color_viridis_d() function also has several built-in palettes.
# You can use them as follows.

ggplot(
  data = penguins,
  mapping = aes(
    x = bill_length_mm,
    y = bill_depth_mm,
    color = island
  )
) +
  geom_point() +
  scale_color_viridis_d(option = "H")

# We can use scale_fill_viridis_d() for the fill aesthetic property.

ggplot(
  data = penguin_bill_length_by_island,
  mapping = aes(
    x = island,
    y = mean_bill_length,
    fill = island
  )
) +
  geom_col() +
  scale_fill_viridis_d()

ggplot(
  data = penguin_bill_length_by_island,
  mapping = aes(
    x = island,
    y = mean_bill_length,
    fill = mean_bill_length
  )
) +
  geom_col() +
  scale_fill_viridis_c()

ggplot(
  data = penguins,
  mapping = aes(
    x = bill_length_mm,
    y = bill_depth_mm,
    color = bill_depth_mm
  )
) +
  geom_point() +
  scale_color_viridis_c()
