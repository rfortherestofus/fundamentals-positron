# Load Packages -----------------------------------------------------------

library(tidyverse)

# Import Data -------------------------------------------------------------

penguins <- read_csv("penguins.csv")

# Histograms --------------------------------------------------------------

# We use geom_histogram() to make a histogram.

ggplot(
  data = penguins,
  mapping = aes(
    x = bill_length_mm
  )
) +
  geom_histogram()

# How does ggplot know what to plot on the y axis?
# It's using the default statistical transformation for geom_histogram,
# which is stat = "bin".

# If we add stat = "bin" we get the same thing.
# Each geom has a default stat.

ggplot(
  data = penguins,
  mapping = aes(
    x = bill_length_mm
  )
) +
  geom_histogram(stat = "bin")

# We can adjust the number of bins using the bins argument.

ggplot(
  data = penguins,
  mapping = aes(
    x = bill_length_mm
  )
) +
  geom_histogram(bins = 100)
