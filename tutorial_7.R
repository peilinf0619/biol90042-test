library(tidyverse)
dosage <- read.csv("https://raw.githubusercontent.com/WEHI-Education/BIOL90042_R_Course/refs/heads/main/data/mousezempic_dosage_data.csv")
dosage %>%
  # first convert drug_dose_g into mg
  # to make it easier to read
  mutate(dose_mg = drug_dose_g * 10000) %>%
  # now make a scatterplot
  ggplot(aes(x = dose_mg, y = weight_lost_g, colour = mouse_strain)) +
  geom_point() +
  # nicer colour palette
  scale_colour_manual(values = c("#ab2929", "#73b7bd", "#ccd65c")) +
  # theme and labels
  theme_classic() +
  labs(
    x = "Drug dosage (mg)",
    y = "Weight lost (mg)",
    colour = "Mouse strain",
    title = "Relationship between drug dosage and weight lost"
  )