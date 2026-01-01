#INSTALLING PACKAGES
install.packages(c("haven", "dplyr", "tidyr", "sdtm.oak"))

#LOADING PACKAGES
library(haven)    # reads XPT (SAS transport files)
library(dplyr)    # data manipulation
library(tidyr)    # reshaping (wide → long)
library(sdtm.oak) # traceability + SDTM-style workflow

#READING PACKAGES
demo_raw <- read_xpt("DEMO_J.XPT")
bpx_raw  <- read_xpt("BPX_J.XPT")
rx_raw   <- read_xpt("RXQ_RX_J.XPT")
mcq_raw  <- read_xpt("MCQ_J.XPT")

#ADDING TRACEABILITY (VERY IMPORTANT)
demo_raw <- generate_oak_id_vars(demo_raw, pat_var = "SEQN", raw_src = "DEMO_J")
bpx_raw  <- generate_oak_id_vars(bpx_raw,  pat_var = "SEQN", raw_src = "BPX_J")
rx_raw   <- generate_oak_id_vars(rx_raw,   pat_var = "SEQN", raw_src = "RXQ_RX_J")
mcq_raw  <- generate_oak_id_vars(mcq_raw,  pat_var = "SEQN", raw_src = "MCQ_J")
