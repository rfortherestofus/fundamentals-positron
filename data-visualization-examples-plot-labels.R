# Load Packages -----------------------------------------------------------

library(tidyverse)

# Import Data -------------------------------------------------------------

penguins <- read_csv("penguins.csv")

# Plot Labels -------------------------------------------------------------

# To start, let's make a new data frame

penguin_bill_length_by_island_and_sex <-
  penguins |>
  drop_na(sex) |>
  group_by(island, sex) |>
  summarize(mean_bill_length = mean(bill_length_mm))

# Now let's plot this data frame using a bar chart.

ggplot(
  data = penguin_bill_length_by_island_and_sex,
  mapping = aes(
    x = island,
    y = mean_bill_length,
    fill = sex
  )
) +
  geom_col()

# The bars are stacked by default.
# To put them side by side, we use the
# position = "dodge" argument within geom_col().

ggplot(
  data = penguin_bill_length_by_island_and_sex,
  mapping = aes(
    x = island,
    y = mean_bill_length,
    fill = sex
  )
) +
  geom_col(position = "dodge")

# To add labels to our plot, we use labs().

# We can add a title to the plot with the title argument.

ggplot(
  data = penguin_bill_length_by_island_and_sex,
  mapping = aes(
    x = island,
    y = mean_bill_length,
    fill = sex
  )
) +
  geom_col(position = "dodge") +
  labs(title = "Males have longer bills than females")

# We can also add a subtitle and caption

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
    caption = "Data from the palmerpenguins R package"
  )

# We can change the x and y axis labels using the x and y arguments.

ggplot(
  data = penguin_bill_length_by_island_and_sex,
  mapping = aes(x = island, y = mean_bill_length, fill = sex)
) +
  geom_col(position = "dodge") +
  labs(
    title = "Males have longer bills than females",
    subtitle = "But they're all good penguins",
    caption = "Data from the palmerpenguins R package",
    x = "Island",
    y = "Mean Bill Length in Millimeters"
  )

# To change the legend title,
# we use the name of the aesthetic that is being shown.

ggplot(
  data = penguin_bill_length_by_island_and_sex,
  mapping = aes(x = island, y = mean_bill_length, fill = sex)
) +
  geom_col(position = "dodge") +
  labs(
    title = "Males have longer bills than females",
    subtitle = "But they're all good penguins",
    caption = "Data from the palmerpenguins R package",
    x = "Island",
    y = "Mean Bill Length in Millimeters",
    fill = "Sex"
  )

# You can remove plot labels using NULL

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
  )
