# rwe-breast-cancer-cohort
Breast cancer cohort construction and data cleaning in R


This project demonstrates how to:

Load a public breast cancer dataset (mlbench::BreastCancer)

Clean and recode variables

Construct a simple RWE-style analytic cohort

Produce a basic baseline table and plots in R

Main scripts are in scripts/:

00_setup.R – loads packages and sets project paths

01_load_data.R – loads the raw breast cancer data and saves it in data_raw/

02_define_cohort.R – cleans variables and defines the analytic cohort

03_clean_baseline.R – creates additional baseline markers

04_export_final_dataset.R – exports the final cohort as RDS and CSV

To reproduce:

Open the project in RStudio.

Run the scripts in order (00 → 04).

Knit reports/cohort_build.Rmd to view the report.