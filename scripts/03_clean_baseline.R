# scripts/03_clean_baseline.R

source(here::here("scripts", "00_setup.R"))

bc_cohort <- readRDS(here::here("data_clean", "cohort_step1.rds"))

bc_baseline <- bc_cohort %>%
  mutate(
    # Example: high_cell_size marker
    high_cell_size = if_else(cell_size >= 5, 1L, 0L),
    # Example: high_cell_shape marker
    high_cell_shape = if_else(cell_shape >= 5, 1L, 0L)
  )

saveRDS(bc_baseline, here::here("data_clean", "cohort_baseline.rds"))

