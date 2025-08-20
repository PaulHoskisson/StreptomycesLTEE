library(tidyr)
library(dplyr)
library(ggplot2)
# Load required libraries
library(tidyr)
library(dplyr)
library(ggplot2)

data_long <- read.csv("data_long_mm-edit.csv")

# Define y-axis label with mu symbol
y_label <- expression("Aggregate area (mm"^{2}*")")

# Plot
p_violin <- ggplot(data_long, aes(x = Group, y = Expression_mm)) +
  geom_boxplot(fill = "white", outlier.shape = NA) +
  geom_jitter(aes(color = Generation), width = 0.2, size = 4) +  # Color points by Generation
  scale_color_manual(values = c(
    "M1152" = "black",  # Black for progenitor
    "Y1" = "#1f77b4",  # Blue
    "Y2" = "#ff7f0e",  # Orange
    "Y3" = "#2ca02c"  # Green
  )) +
  labs(
    x = "Generations",
    y = y_label,
    color = "Generations"
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
    axis.text = element_text(color = "black", size = 24),
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
ggsave("box_plot_grouped_by_timepoint_colored_final_mm.png", plot = p_violin, width = 10, height = 7, dpi = 300, bg = "white")