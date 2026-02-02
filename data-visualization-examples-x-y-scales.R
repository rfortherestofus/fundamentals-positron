# Load Packages -----------------------------------------------------------

library(tidyverse)

# Import Data -------------------------------------------------------------

penguins <- read_csv("penguins.csv")

penguin_bill_length_by_island <-
  penguins |>
  group_by(island) |>
  summarize(mean_bill_length = mean(bill_length_mm, na.rm = TRUE)) |>
  arrange(mean_bill_length)

# Setting x and y Scales --------------------------------------------------

# Adjusting our x and y axes is similar.
# Remember that the x and y axes are considered an aesthetic properties
# in the same way color and fill are.

# We adjust our x and y axes using the scale_ set of functions.
# The exact function you use depends on your data.
# For example, you would use scale_y_continuous()
# if you have continuous data on the y axis.

# The limits argument sets the minimum and maximum values that display.

ggplot(
  data = penguin_bill_length_by_island,
  mapping = aes(
    x = island,
    y = mean_bill_length,
    fill = island
  )
) +
  geom_col() +
  scale_y_continuous(limits = c(0, 50))

# The breaks argument determines which axis labels show up.

ggplot(
  data = penguin_bill_length_by_island,
  mapping = aes(
    x = island,
    y = mean_bill_length,
    fill = island
  )
) +
  geom_col() +
  scale_y_continuous(
    limits = c(0, 50),
    breaks = c(0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50)
  )

# If we want to change the x axis labels, we'd need to use
# the labels argument in scale_x_discrete() because that data is categorical.

ggplot(
  data = penguin_bill_length_by_island,
  mapping = aes(
    x = island,
    y = mean_bill_length,
    fill = island
  )
) +
  geom_col() +
  scale_y_continuous(
    limits = c(0, 50),
    breaks = c(0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50)
  ) +
  scale_x_discrete(
    labels = c("Biscoe Island", "Dream Island", "Torgersen Island")
  )
