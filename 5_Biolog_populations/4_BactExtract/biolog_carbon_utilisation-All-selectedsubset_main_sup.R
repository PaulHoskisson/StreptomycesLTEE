# Load required libraries
library(tidyr)
library(dplyr)
library(ggplot2)
library(readxl)
library(tidyverse)

# Read Excel data
df <- read_excel("2024-08-01_growthParameters_LTEE_PM1_48h_edit_04-08-25_cut_edit_top-bottom_edit3_carbon sources.xlsx")

# Set factor levels for Time
df$Time <- factor(df$Time, levels = c("Progenitor", "1000", "2000", "3000"))

# Convert Time to numeric for fitting (used only in smooth line)
df <- df %>%
  mutate(Time_numeric = case_when(
    Time == "Progenitor" ~ 0,
    Time == "1000" ~ 1000,
    Time == "2000" ~ 2000,
    Time == "3000" ~ 3000,
    TRUE ~ NA_real_
  ))

# Define y-axis label with mu symbol
y_label <- expression("Specific growth rates, " * mu * " (h"^{-1}*")")

# Create a combined column for coloring
df <- df %>%
  mutate(ValueColor = case_when(
      #!is.na(A05) ~ as.character(A05),  # Take High value if present
      #!is.na(A08) ~ as.character(A08),    # Otherwise take Low value
      #!is.na(B11) ~ as.character(B11),    # Otherwise take Low value
      !is.na(C03) ~ as.character(C03),  # Take High value if present
      #!is.na(C08) ~ as.character(C08),    # Otherwise take Low value
      #!is.na(E11) ~ as.character(E11),  # Take High value if present
      !is.na(C09) ~ as.character(C09),    # Otherwise take Low value
      !is.na(H08) ~ as.character(H08),    # Otherwise take Low value
      #!is.na(D05) ~ as.character(D05),    # Otherwise take Low value
      TRUE ~ NA_character_
  ))

# Define a custom color palette for values 1–10
value_colors <- c(
  "1" = "#e41a1c",  # red
  "2" = "#377eb8",  # blue
  "3" = "#4daf4a",  # green
  "4" = "#984ea3",  # purple
  "5" = "#ff7f00",  # orange
  "6" = "#ffff33",  # yellow
  "7" = "#a65628",  # brown
  "8" = "#f781bf",  # pink
  "9" = "#999999",  # grey
  "10" = "#66c2a5"  # teal
)

df <- df %>% filter(!is.na(Time))

# Plot
p_violin <- ggplot(df, aes(x = Time, y = OD.r)) +
  # Violin plot
  geom_violin(fill = "white", outlier.shape = NA) +

  # Black points first (those with NA ValueColor)
  geom_jitter(
    data = df %>% filter(is.na(ValueColor)),
    color = "black",
    width = 0.2,
    size = 2
  ) +

  # Colored points next (those with ValueColor defined)
  geom_jitter(
    data = df %>% filter(!is.na(ValueColor)),
    aes(color = ValueColor),
    width = 0.2,
    size = 2
  ) +

  # Manual color scale for carbon sources
  scale_color_manual(
    name = "Carbon source",
    values = value_colors,
    na.value = "black",
    labels = c(
      "1" = "C09: Glucose",
      "2" = "C03: Malic acid",
      "3" = "H08: Pyruvic acid",
      
      #"1" = "C08: Acetic acid",
      #"2" = "E11: 2-Deoxy\nAdenosine",
      #"3" = "D05: Tween 40",
      "4" = "Others"
    )
  ) +

  # Labels and theme
  labs(
    x = "Generations",
    y = y_label,
    color = "Carbon Source"
  ) +
  scale_x_discrete(labels = c("Progenitor", "1000", "2000", "3000")) +
  theme(
    text = element_text(size = 24),
    axis.line.x.bottom = element_line(size = 1),
    axis.line.y.left = element_line(size = 1),
    plot.background = element_rect(fill = "white"),
    panel.background = element_rect(fill = "white"),
    panel.grid.major = element_line(color = "#ECECEC"),
    panel.grid.minor = element_blank(),
    axis.line = element_line(color = "black"),
    axis.text = element_text(color = "black", size = 24, hjust = 0.5),
    axis.title = element_text(color = "black"),
    axis.title.x = element_text(size = 24),
    axis.title.y = element_text(size = 24),
    axis.text.x = element_text(size = 24, angle = 45, hjust = 1),
    axis.text.y = element_text(size = 24),
    panel.border = element_blank(),
    legend.position = "right"
  )

# Print the plot
print(p_violin)

# Save the plot as PNG
ggsave("biolog_carbon_utilisation-All-selectedsubsetFinal-main.png",
       plot = p_violin, width = 10, height = 7, dpi = 300, bg = "white")
