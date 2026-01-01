#DOMAIN 2 — VS (VITAL SIGNS)
#RESHAPING BP DATA

vs_long <- bpx_raw %>%
  pivot_longer(
    cols = c(starts_with("BPXSY"), starts_with("BPXDI")),
    names_to = "RAW_TEST",
    values_to = "VALUE"
  )

#Build SDTM VS (VITAL SIGNS)

vs <- vs_long %>%
  mutate(
    STUDYID  = "NHANES1718",
    DOMAIN   = "VS",
    USUBJID  = paste("NHANES1718", SEQN, sep = "-"),
    
    VSTESTCD = case_when(
      grepl("^BPXSY", RAW_TEST) ~ "SYSBP",
      grepl("^BPXDI", RAW_TEST) ~ "DIABP"
    ),
    
    VSTEST = case_when(
      VSTESTCD == "SYSBP" ~ "Systolic Blood Pressure",
      VSTESTCD == "DIABP" ~ "Diastolic Blood Pressure"
    ),
    
    VSORRES  = VALUE,
    VSORRESU = "mmHg"
  ) %>%
  filter(!is.na(VSORRES))
