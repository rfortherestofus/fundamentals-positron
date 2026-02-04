# Load Packages -----------------------------------------------------------

library(tidyverse)
library(janitor)

# Import Data -------------------------------------------------------------

# Data from https://github.com/rstudio/r-community-survey

survey_data <-
  read_tsv("2020-combined-survey-final.tsv") |>
  clean_names()

avg_r_enjoyment <-
  survey_data |>
  drop_na(qr_enjoyment) |>
  group_by(qcountry) |>
  summarize(
    avg_enjoyment = mean(qr_enjoyment),
    number_of_responses = n()
  ) |>
  filter(number_of_responses >= 10) |>
  arrange(desc(avg_enjoyment))
