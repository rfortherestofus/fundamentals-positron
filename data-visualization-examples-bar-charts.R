# Load Packages -----------------------------------------------------------

library(tidyverse)

# Import Data -------------------------------------------------------------

penguins <- read_csv("penguins.csv")

# Bar Charts --------------------------------------------------------------

# There are two basic approaches to making bar charts,
# both of which use geom_bar().

# Approach #1

# Use your full dataset.
# Only assign a variable to the x axis.
# Let ggplot use the default stat transformation (stat = "count")
# to generate counts that it then plots on the y axis.

ggplot(
  data = penguins,
  mapping = aes(
    x = bill_length_mm
  )
) +
  geom_bar()

# The default statistical transformation for geom_bar() is count.
# This will give us the same result as our previous plot.

ggplot(
  data = penguins,
  mapping = aes(
    x = bill_length_mm
  )
) +
  geom_bar(stat = "count")

# Approach #2

# Wrangle your data frame before plotting, creating a new data frame
# in the process
# Assign variables to the x and y axes
# Use stat = "identity" to tell ggplot to use the data exactly as it is

# It's often easier to do our analysis work, save a data frame,
# and then use this to plot.
# Let's recreate our penguin_bill_length_by_island data frame.

penguin_bill_length_by_island <-
  penguins |>
  group_by(island) |>
  summarize(mean_bill_length = mean(bill_length_mm, na.rm = TRUE)) |>
  arrange(mean_bill_length)

# Then let's use this data frame to make a bar chart.
# The stat = "identity" here tells ggplot to use the exact data points
# without any statistical transformations.

ggplot(
  data = penguin_bill_length_by_island,
  mapping = aes(
    x = island,
    y = mean_bill_length
  )
) +
  geom_bar(stat = "identity")

# We can easily also flip the x and y axes.

ggplot(
  data = penguin_bill_length_by_island,
  mapping = aes(
    x = mean_bill_length,
    y = island
  )
) +
  geom_bar(stat = "identity")

# We can also use geom_col(), which is the same as geom_bar(stat = "identity")

ggplot(
  data = penguin_bill_length_by_island,
  mapping = aes(
    x = island,
    y = mean_bill_length
  )
) +
  geom_col()
