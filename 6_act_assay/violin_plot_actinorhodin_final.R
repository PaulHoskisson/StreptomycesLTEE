library(tidyr)
library(dplyr)
library(ggplot2)
# Load required libraries
library(tidyr)
library(dplyr)
library(ggplot2)

library(readxl)
library(tidyverse)

# Read Excel data
df <- read_excel("Act_for_R_JTM_edit.xlsx")

df$Group <- factor(df$Group, levels = c("M1152", "M1152+", "1000", "2000", "3000"))

# Define y-axis label with mu symbol
y_label <- expression("Actinorhodin titre (" * mu * "g L"^{-1}*")")

# Plot
p_violin <- ggplot(df, aes(x = Group, y = TiterL)) +
  geom_violin(fill = "white", outlier.shape = NA) +
  geom_jitter(aes(color = ID), width = 0.2, size = 4) +  # Color points by Generation
  scale_color_manual(values = c(
    "M1152" = "black",  # Black for progenitor
    "M1152+" = "#B1B1B1",
    "Y1" = "#1f77b4",  # Blue
    "Y2" = "#ff7f0e",  # Orange
    "Y3" = "#2ca02c"  # Green
  )) +
  labs(
    x = "Generations",
    y = y_label,
    color = "Generations"
  ) +
  scale_x_discrete(labels = c("Progenitor", "Progenitor \ncontaining \nACT     ", "1000", "2000", "3000")) +
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
    legend.position = "none"
  )


# Print the plot
print(p_violin)

# Save the plot as PNG
ggsave("Actinorhodin_violin_plot_grouped_by_timepoint_colored4_final_check.png", plot = p_violin, width = 10, height = 7, dpi = 300, bg = "white")