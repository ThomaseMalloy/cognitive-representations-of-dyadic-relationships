# Study 3: Family members (182 round robins)
# TripleR replication of the SOREMO analyses.
# Each construct is a latent variable with two indicators.

library(TripleR)

d <- read.csv("data/long/Study3_Family_long.csv")
supportive <- subset(d, relationship == "Supportive")
harmful    <- subset(d, relationship == "Harmful")

# ---- Supportive family members ----
RR(support1/support2 ~ actor*partner | group, data = supportive, na.rm = TRUE)  # Support
RR(harm1/harm2       ~ actor*partner | group, data = supportive, na.rm = TRUE)  # Harm
RR(listen1/listen2   ~ actor*partner | group, data = supportive, na.rm = TRUE)  # Listening
RR(value1/value2     ~ actor*partner | group, data = supportive, na.rm = TRUE)  # Relationship value
RR(trust1/trust2     ~ actor*partner | group, data = supportive, na.rm = TRUE)  # Trust

# ---- Harmful family members ----
RR(support1/support2 ~ actor*partner | group, data = harmful, na.rm = TRUE)     # Support
RR(harm1/harm2       ~ actor*partner | group, data = harmful, na.rm = TRUE)     # Harm
RR(listen1/listen2   ~ actor*partner | group, data = harmful, na.rm = TRUE)     # Listening
RR(value1/value2     ~ actor*partner | group, data = harmful, na.rm = TRUE)     # Relationship value
RR(trust1/trust2     ~ actor*partner | group, data = harmful, na.rm = TRUE)     # Trust
