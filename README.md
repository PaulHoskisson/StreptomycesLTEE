# StreptomycesLTEE
Code and data associated with the Streptomyces coelicolor LTEE experiment.

-----------------------------------------------------

Publications associated:

Pre-submission

LTEE paper 1

Adaptive radiation during long-term experimental evolution of the multicellular bacterium, Streptomyces
John T Munnoch1*, Silja Vahtokari1, Leena Kerr2 & Paul A Hoskisson1*,


-----------------------------------------------------
Content:

1_Genome_sequencing_M1152_genome

2_Population_colony_morphology_and_Diversity_Index

3_Aggregate_morphology

4-Specific_growth_rates_populations_isolates_and_ACT

5_Biolog_populations

------------------------------------------------------

1_Genome_sequencing_M1152_genome:

Contains files for the construction of the M1152 genome from S. coelicolor M145.  Includes NC_003888 reference genome used as the base, Illumina sequence files are available here: PRJNA1304580 and SAMN50561540.  The manually edited file contain the intentional mutations from the M1152 publication (https://pmc.ncbi.nlm.nih.gov/articles/PMC3818861/) plus the mutations identified by SNIPPY analysis (M1152_fasta_JTM_edit_SNIPPY_progenitor_paper.xlsx) are available in the final version of the genome "M1152_SLTEE.gb" in genbank and fasta format.


2_Population_colony_morphology_and_Diversity_Index:

Figure 1D. This includes the colony morphology plate images used in counts, the diversity index raw data, compiled set for input into the R script, the script itself and the subset of figure 1 (1d).


3_Aggregate_morphology:

Figure 2A and 2B.  This includes the images including marked area of measurement (Flatten_area_scale_bar), area measurements (Area measurements.xlsx), R scripts, data input (data_long_mm-edit.csv) and output (.png).


4-Specific_growth_rates_populations_isolates_and_ACT:

Figure 2C and 2D Contains raw data, R-scripts and output plots for growth curve data (generate using Tecan plate reader) for isolate coloneys and populations along with dry weight measurements and Actinorhodin quantification assay results.

5_Biolog_populations:

Contains population Biolog data using PM1 plates.  Includes data processing steps (folders 1-4), scripts (4) and final plots (3 and 4) along with utility files (folder a)containing e.g. well position annotations e.g. A1-Negative control.

In brief, sample data was taken, M1152 triplicate was averaged and tidy data generated selecting for 48h (01_get_tidy_data_all_samples_M1152_average_48h.py).  Tidy data was generated for the other samples (01_get_tidy_data_all_samples_PM1.py).  Sample CSV files (folder 1), melted data used for plotting (folder 2) and plots (folder 3) for assessing growth curves are available.  BactExtract files (including template) used for uploading and acquiring growthParamter data are available (4_BactExtract) along with R code and plots.

