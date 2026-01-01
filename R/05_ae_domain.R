#DOMAIN 4 — AE-LIKE (FROM MEDICAL CONDITIONS)
#Build AE-like dataset

ae <- mcq_raw %>%
  filter(MCQ160A == 1) %>%  # example condition
  mutate(
    STUDYID = "NHANES1718",
    DOMAIN  = "AE",
    USUBJID = paste("NHANES1718", SEQN, sep = "-"),
    AETERM  = "Hypertension"
  ) %>%
  select(STUDYID, DOMAIN, USUBJID, AETERM)
