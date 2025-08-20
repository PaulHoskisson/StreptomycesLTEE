if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

# Install ggplot2 and load the library
install.packages("ggplot2")
library('ggplot2')

# ensure all column headers are the same for all csv files (i.e. add well information)
## Melts were performed using python script: "01_get_tidy_data_all_samples_PM1.py" and "01_get_tidy_data_all_samples_PM3b.py"

# ------------------------------------Cutting all down to 48h-----------------------------------------------

# This is done using python script on data cut down to 48h: "01_get_tidy_data_all_samples_M1152_average_48h.py"
#                                                           "01_get_tidy_data_all_samples_PM1_48h.py"

# ------------------------------------Average_M1152 samples-----------------------------------------------

# This is done using python scripts: "03_average_csv_files_PM1.py"

# ---------------------------------Load_new_M1152_average_files after melting-------------------------

# note: the averaging process changes "-" to "." in the column names, past the correct ones on manually.
# note: if column names don't match exactly it will print multiple plots.


# read csv data from files into a variable
data01 <- read.csv("2_melted_data/average_M1152_1_PM1_melted_48h.csv")
data02 <- read.csv("2_melted_data/Y1P062 - PM1_melted.csv")
data03 <- read.csv("2_melted_data/Y1P126 - PM1_melted.csv")
data04 <- read.csv("2_melted_data/Y1P188 - PM1_melted.csv")
data05 <- read.csv("2_melted_data/Y2P062 - PM1_melted.csv")
data06 <- read.csv("2_melted_data/Y2P126 - PM1_melted.csv")
data07 <- read.csv("2_melted_data/Y2P188 - PM1_melted.csv")
data08 <- read.csv("2_melted_data/Y3P062 - PM1_melted.csv")
data09 <- read.csv("2_melted_data/Y3P126 - PM1_melted.csv")
data10 <- read.csv("2_melted_data/Y3P188 - PM1_melted.csv")


# ---------------------------------Make M1152 and linage graphs (48h cut off) --------------------------------------------

# Create a PDF file for saving the plot (smaller file size)
pdf(file='3_plots/Y1_PM1_data_annotated_48h.pdf', width=30, height=15)

# Create the plot with the first data set
p <- ggplot(data27, aes(y = Value, x = Hour)) +
  geom_jitter(alpha = 0.2) +
  facet_wrap(Type ~ ., scales = 'free_x', nrow = 8, dir = 'h')

# Add lines for additional data sets
p <- p +
  geom_point(data = data02, aes(y = Value, x = Hour), color = "red") +
  geom_point(data = data03, aes(y = Value, x = Hour), color = "blue") +
  geom_point(data = data04, aes(y = Value, x = Hour), color = "orange") +
  geom_jitter(alpha = 0.2)

# Print the plot
print(p)

# Close the PDF device (saves the file)
dev.off()

# Create a PDF file for saving the plot (smaller file size)
pdf(file='Final_processing/3_plots/Y2_PM1_data_annotated_48h.pdf', width=30, height=15)

# Create the plot with the first data set
p <- ggplot(data27, aes(y = Value, x = Hour)) +
  geom_jitter(alpha = 0.2) +
  facet_wrap(Type ~ ., scales = 'free_x', nrow = 8, dir = 'h')

# Add lines for additional data sets
p <- p +
  geom_point(data = data05, aes(y = Value, x = Hour), color = "red") +
  geom_point(data = data06, aes(y = Value, x = Hour), color = "blue") +
  geom_point(data = data07, aes(y = Value, x = Hour), color = "orange") +
  geom_jitter(alpha = 0.2)

# Print the plot
print(p)

# Close the PDF device (saves the file)
dev.off()

# Create a PDF file for saving the plot (smaller file size)
pdf(file='Final_processing/3_plots/Y3_PM1_data_annotated_48h.pdf', width=30, height=15)

# Create the plot with the first data set
p <- ggplot(data27, aes(y = Value, x = Hour)) +
  geom_jitter(alpha = 0.2) +
  facet_wrap(Type ~ ., scales = 'free_x', nrow = 8, dir = 'h')

# Add lines for additional data sets
p <- p +
  geom_point(data = data08, aes(y = Value, x = Hour), color = "red") +
  geom_point(data = data09, aes(y = Value, x = Hour), color = "blue") +
  geom_point(data = data10, aes(y = Value, x = Hour), color = "orange") +
  geom_jitter(alpha = 0.2)

# Print the plot
print(p)

# Close the PDF device (saves the file)
dev.off()
