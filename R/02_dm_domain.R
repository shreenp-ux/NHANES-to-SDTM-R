#DOMAIN SDTM
#DOMAIN 1 — DM (DEMOGRAPHICS)

dm <- demo_raw %>%
  mutate(
    STUDYID = "NHANES1718",
    DOMAIN  = "DM",
    USUBJID = paste("NHANES1718", SEQN, sep = "-"),
    AGE     = RIDAGEYR,
    AGEU    = "YEARS",
    SEX     = case_when(
      RIAGENDR == 1 ~ "M",
      RIAGENDR == 2 ~ "F",
      TRUE ~ NA_character_
    ),
    RACE = case_when(
      RIDRETH3 == 3 ~ "WHITE",
      RIDRETH3 == 4 ~ "BLACK OR AFRICAN AMERICAN",
      RIDRETH3 == 6 ~ "ASIAN",
      TRUE ~ "OTHER"
    )
  ) %>%
  select(STUDYID, DOMAIN, USUBJID, AGE, AGEU, SEX, RACE)
