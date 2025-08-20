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
df <- read_excel("Growth_rates_populations_relative.xlsx")

df$Generation <- factor(df$Generation, levels = c("1000", "2000", "3000"))

# Define y-axis label with mu symbol
y_label <- expression("Mean fitness relative to the ancestor")

# Plot
p_violin <- ggplot(df, aes(x = Generation, y = relative_final)) +
  geom_violin(fill = "white", outlier.shape = NA) +
  geom_jitter(aes(color = Type), width = 0.2, size = 4) +  # Color points by Generation
  geom_smooth(aes(group = 1), method = "loess", se = FALSE, color = "red", size = 1.2) +
  geom_hline(yintercept = 1, color = "black", linetype = "dashed", size = 1) +
  scale_color_manual(values = c(
    "p" = "black",  # Black for progenitor
    "Y1" = "#1f77b4",  # Blue
    "i" = "#ff7f0e",  # Orange
    "Y3" = "#2ca02c"  # Green
  )) +
  labs(
    x = "Generations",
    y = y_label,
    color = "Generations"
  ) +
  scale_x_discrete(labels = c("1000", "2000", "3000")) +
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
ggsave("Populaiton_relative_growth_rate.png", plot = p_violin, width = 10, height = 7, dpi = 300, bg = "white")