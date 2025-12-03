# scripts/01_load_data.R

source(here::here("scripts", "00_setup.R"))

# Load the BreastCancer dataset from mlbench
data("BreastCancer", package = "mlbench")

bc_raw <- BreastCancer

# Quick look at the data
glimpse(bc_raw)

# Save a raw copy
if (!dir.exists(here("data_raw"))) dir.create(here("data_raw"))
saveRDS(bc_raw, here::here("data_raw", "breast_cancer_raw.rds"))
