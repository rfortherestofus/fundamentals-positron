# Load Packages -----------------------------------------------------------

library(tidyverse)

# Import Data -------------------------------------------------------------

penguins <- read_csv("penguins.csv")

penguin_bill_length_by_island <-
  penguins |>
  group_by(island) |>
  summarize(mean_bill_length = mean(bill_length_mm, na.rm = TRUE)) |>
  arrange(mean_bill_length)

# Adding Text to Plots ---------------------------------------------------------

# Text is just another geom.
# We can use geom_text() to add labels to our figures.

ggplot(
  data = penguin_bill_length_by_island,
  mapping = aes(
    x = island,
    y = mean_bill_length,
    fill = island,
    label = mean_bill_length
  )
) +
  geom_col() +
  geom_text()

# Those text labels are too long!
# Let's create a new variable to use for plotting.
# We're using the number() function from the scales package
# to make this variable

library(scales)

penguin_bill_length_by_island_v2 <-
  penguin_bill_length_by_island |>
  mutate(mean_bill_length_one_digit = number(mean_bill_length, accuracy = 0.1))

# Now let's plot using our new data frame

ggplot(
  data = penguin_bill_length_by_island_v2,
  mapping = aes(
    x = island,
    y = mean_bill_length,
    fill = island,
    label = mean_bill_length_one_digit
  )
) +
  geom_col() +
  geom_text()

# Note that we use mean_bill_length_one_digit for the label aesthetic property
# and mean_bill_length for y.
# If you use mean_bill_length_one_digit for both, your graph will
# look different.

ggplot(
  data = penguin_bill_length_by_island_v2,
  mapping = aes(
    x = island,
    y = mean_bill_length_one_digit,
    fill = island,
    label = mean_bill_length_one_digit
  )
) +
  geom_col() +
  geom_text()

# We can use the hjust and vjust arguments to horizontally and vertically
# adjust text.

# vjust = 0 puts the labels on the outer edge of the bars.

ggplot(
  data = penguin_bill_length_by_island_v2,
  mapping = aes(
    x = island,
    y = mean_bill_length,
    fill = island,
    label = mean_bill_length_one_digit
  )
) +
  geom_col() +
  geom_text(vjust = 0)

# vjust = 1 puts the labels at the inner edge of the bars.

ggplot(
  data = penguin_bill_length_by_island_v2,
  mapping = aes(
    x = island,
    y = mean_bill_length,
    fill = island,
    label = mean_bill_length_one_digit
  )
) +
  geom_col() +
  geom_text(vjust = 1)

# I often do something like vjust = 1.5 to give a bit more padding.

ggplot(
  data = penguin_bill_length_by_island_v2,
  mapping = aes(
    x = island,
    y = mean_bill_length,
    fill = island,
    label = mean_bill_length_one_digit
  )
) +
  geom_col() +
  geom_text(vjust = 1.5)

# We can adjust the color of the text using the color argument.
# We're putting it outside of the aes() because we are setting it
# for the whole layer.

ggplot(
  data = penguin_bill_length_by_island_v2,
  mapping = aes(
    x = island,
    y = mean_bill_length,
    fill = island,
    label = mean_bill_length_one_digit
  )
) +
  geom_col() +
  geom_text(vjust = 1.5, color = "white")

# geom_label() is nearly identical but it adds a background.
# With geom_label() the color argument determines the text and border color
# while the fill is the background color.

ggplot(
  data = penguin_bill_length_by_island_v2,
  mapping = aes(
    x = island,
    y = mean_bill_length,
    fill = island,
    label = mean_bill_length_one_digit
  )
) +
  geom_col() +
  geom_label(vjust = 1.5, color = "white", fill = "black")
