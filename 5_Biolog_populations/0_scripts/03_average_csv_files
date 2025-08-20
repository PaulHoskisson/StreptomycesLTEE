import pandas as pd

# List of CSV file paths
file_paths = ['/Users/johnmunnoch/Documents/Work/4_2023-onwards/0-LTEE_continued/Biolog_community_1k-2k-3k_PM1-PM3b/Final_processing/1_Samples_csv_files/M1152_1_PM1.csv', '/Users/johnmunnoch/Documents/Work/4_2023-onwards/0-LTEE_continued/Biolog_community_1k-2k-3k_PM1-PM3b/Final_processing/1_Samples_csv_files/M1152_2_PM1.csv', '/Users/johnmunnoch/Documents/Work/4_2023-onwards/0-LTEE_continued/Biolog_community_1k-2k-3k_PM1-PM3b/Final_processing/1_Samples_csv_files/M1152_3_PM1.csv']

# Read all CSV files into dataframes
dataframes = [pd.read_csv(file) for file in file_paths]

# Ensure all dataframes have the same structure
# Assuming all dataframes have the same columns and indices
# If not, this should be validated

# Stack the dataframes along a new dimension and calculate the mean along this dimension
averaged_df = pd.concat(dataframes).groupby(level=0).mean()

# Save the result to a new CSV file
averaged_df.to_csv('/Users/johnmunnoch/Documents/Work/4_2023-onwards/0-LTEE_continued/Biolog_community_1k-2k-3k_PM1-PM3b/Final_processing/1_Samples_csv_files/average_M1152_1_PM1.csv', index=False)
