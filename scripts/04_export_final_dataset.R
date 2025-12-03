# scripts/04_export_final_dataset.R

source(here::here("scripts", "00_setup.R"))

bc_baseline <- readRDS(here::here("data_clean", "cohort_baseline.rds"))

cohort_final <- bc_baseline

# Save as RDS and CSV
saveRDS(cohort_final, here::here("data_clean", "breast_cancer_cohort_final.rds"))
readr::write_csv(cohort_final, here::here("data_clean", "breast_cancer_cohort_final.csv"))
