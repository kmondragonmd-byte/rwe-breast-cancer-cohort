# scripts/02_define_cohort.R

source(here::here("scripts", "00_setup.R"))

bc_raw <- readRDS(here::here("data_raw", "breast_cancer_raw.rds"))

# Clean names and remove ID column
bc_clean <- bc_raw %>%
  janitor::clean_names() %>%
  rename(
    patient_id = id,
    outcome = class
  ) %>%
  # Remove rows with missing outcome
  filter(!is.na(outcome))

# Convert outcome to a binary factor (Benign / Malignant)
bc_clean <- bc_clean %>%
  mutate(
    outcome = factor(outcome,
                     levels = c("benign", "malignant"))
  )

# Many of the predictor variables are stored as character;
# convert them to numeric
numeric_vars <- c(
  "cl_thickness", "cell_size", "cell_shape", "marg_adhesion",
  "epith_c_size", "bare_nuclei", "bl_cromatin", "normal_nucleoli", "mitoses"
)

bc_clean <- bc_clean %>%
  mutate(across(all_of(numeric_vars), ~ as.numeric(as.character(.))))

# Exclude rows with too many missing numeric values (optional simple rule)
bc_cohort <- bc_clean %>%
  filter(!if_any(all_of(numeric_vars), is.na))

# For RWE flavour, create a fake "age" variable (since dataset lacks age).
# This is purely illustrative: in real RWE you'd bring actual age.
set.seed(123)
bc_cohort <- bc_cohort %>%
  mutate(
    age = sample(30:85, size = n(), replace = TRUE),
    age_group = cut(
      age,
      breaks = c(0, 49, 64, 74, Inf),
      labels = c("<50", "50-64", "65-74", "75+"),
      right = TRUE
    )
  )

# Save step 1 cohort
if (!dir.exists(here("data_clean"))) dir.create(here("data_clean"))
saveRDS(bc_cohort, here::here("data_clean", "cohort_step1.rds"))
