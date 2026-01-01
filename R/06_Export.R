#SDTM VARIABLE LABELS

attr(dm$STUDYID, "label") <- "Study Identifier"
attr(dm$DOMAIN,  "label") <- "Domain Abbreviation"
attr(dm$USUBJID, "label") <- "Unique Subject Identifier"
attr(dm$AGE,     "label") <- "Age"
attr(dm$AGEU,    "label") <- "Age Units"
attr(dm$SEX,     "label") <- "Sex"
attr(dm$RACE,    "label") <- "Race"

#XPT Creation

write_xpt(dm, "dm.xpt")
write_xpt(vs, "vs.xpt")
write_xpt(cm, "cm.xpt")
write_xpt(ae, "ae.xpt")
