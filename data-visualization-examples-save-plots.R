# Load Packages -----------------------------------------------------------

library(tidyverse)
library(ggthemes)

# Import Data -------------------------------------------------------------

penguins <- read_csv("penguins.csv")

penguin_bill_length_by_island_and_sex <-
  penguins |>
  drop_na(sex) |>
  group_by(island, sex) |>
  summarize(mean_bill_length = mean(bill_length_mm))

# Save Plots --------------------------------------------------------------

# If you need to save a plot, you can use the ggsave() function.
# By default ggsave() will save the last plot you made.

# First we plot

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

# Then we save

ggsave(
  filename = "plots/penguins-plot.png",
  height = 8,
  width = 11,
  units = "in",
  bg = "white",
  dpi = 300
)

# We can save our plot to other formats as well.
# PDF is a great option because it produces small file sizes
# and high-quality plots.
# You don't need to list dpi here as PDFs are vector based.

ggsave(
  filename = "plots/penguins-plot.pdf",
  height = 8,
  width = 11,
  units = "in"
)

# You can also save a plot and then use that within ggsave()

penguins_plot <- ggplot(
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

penguins_plot

ggsave(
  plot = penguins_plot,
  filename = "plots/penguins-plot-2.pdf",
  height = 8,
  width = 11,
  units = "in"
)
