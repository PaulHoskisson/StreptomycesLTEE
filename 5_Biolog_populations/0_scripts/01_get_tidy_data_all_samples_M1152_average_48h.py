import pandas as pd

df = pd.read_csv("/Users/johnmunnoch/Documents/Work/4_2023-onwards/0-LTEE_continued/Biolog_community_1k-2k-3k_PM1-PM3b/Final_processing/1_Samples_csv_files/average_M1152_1_PM1_48h.csv")
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("/Users/johnmunnoch/Documents/Work/4_2023-onwards/0-LTEE_continued/Biolog_community_1k-2k-3k_PM1-PM3b/Final_processing/2_melted_data/average_M1152_1_PM1_melted_48h.csv", index=False)

df = pd.read_csv("/Users/johnmunnoch/Documents/Work/4_2023-onwards/0-LTEE_continued/Biolog_community_1k-2k-3k_PM1-PM3b/Final_processing/1_Samples_csv_files/average_M1152_1_PM3b_48h.csv")
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("/Users/johnmunnoch/Documents/Work/4_2023-onwards/0-LTEE_continued/Biolog_community_1k-2k-3k_PM1-PM3b/Final_processing/2_melted_data/average_M1152_1_PM3b_melted_48h.csv", index=False)