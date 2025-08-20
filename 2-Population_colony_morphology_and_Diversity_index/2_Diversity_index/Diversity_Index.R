library(tidyr)
library(tidyverse)
library(readxl)

# Load data
DI_compiled <- read_excel("DI_compiled.xlsx")

# Calculate average line
avg_data <- DI_compiled %>%
  group_by(Timepoint) %>%
  summarise(H_mean = mean(H, na.rm = TRUE))

# Create plot with average line and safer y-limits
DI_plot <- ggplot(data = DI_compiled, aes(x = Timepoint, y = H, group = Line)) +
  geom_line(color = "#B1B1B1") +
  geom_point(aes(shape = Line), size = 4, color = "#B1B1B1") +
  geom_line(data = avg_data, aes(x = Timepoint, y = H_mean, group = 1), color = "black", size = 2) +  # Fix here
  coord_cartesian(ylim = c(0, 1.2)) +
  scale_x_continuous(breaks = c(0, 1000, 2000, 3000),
                     labels = c("Progenitor", "1000", "2000", "3000")) +
  labs(x = "Generations") +
  theme_minimal() +
  theme(
    text = element_text(size = 24),
    axis.line.x.bottom = element_line(size = 1),
    axis.line.y.left = element_line(size = 1),
    plot.background = element_rect(fill = "white", color = NA),
    panel.background = element_rect(fill = "white", color = NA),
    panel.grid.major = element_line(color = "#ECECEC"),
    panel.grid.minor = element_blank(),
    axis.line = element_line(color = "black"),
    axis.text = element_text(color = "black", size = 24),
    axis.title = element_text(color = "black"),
    axis.title.x = element_text(size = 24),
    axis.title.y = element_text(size = 24, face = "italic"),
    axis.text.x = element_text(size = 24, angle = 45, hjust = 1),
    axis.text.y = element_text(size = 24),
    panel.border = element_blank(),
    legend.position = "none"
  )

# Show plot
DI_plot

# Save to PNG with white background
ggsave("diversity_index_update_2.png", plot = DI_plot, width = 10, height = 7, dpi = 300, bg = "white")
