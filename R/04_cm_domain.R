#DOMAIN 3 — CM (CONCOMITANT MEDICATIONS)
#Build SDTM CM

cm <- rx_raw %>%
  mutate(
    STUDYID = "NHANES1718",
    DOMAIN  = "CM",
    USUBJID = paste("NHANES1718", SEQN, sep = "-"),
    CMTRT   = RXDDRUG
  ) %>%
  filter(!is.na(CMTRT)) %>%
  select(STUDYID, DOMAIN, USUBJID, CMTRT)
