# Study 1: Friends (98 round robins)
# TripleR replication of the SOREMO analyses.
# Each construct is a latent variable with two indicators.
# NOTE: Study 1 harm is on its original scale (1 = Always ... 5 = Never),
# so higher harm scores mean LESS harm in this study only.

library(TripleR)

d <- read.csv("data/long/Study1_Friends_long.csv")
supportive <- subset(d, relationship == "Supportive")
harmful    <- subset(d, relationship == "Harmful")

# ---- Supportive friends ----
RR(support1/support2 ~ actor*partner | group, data = supportive, na.rm = TRUE)  # Support
RR(harm1/harm2       ~ actor*partner | group, data = supportive, na.rm = TRUE)  # Harm
RR(listen1/listen2   ~ actor*partner | group, data = supportive, na.rm = TRUE)  # Listening
RR(value1/value2     ~ actor*partner | group, data = supportive, na.rm = TRUE)  # Relationship value
RR(trust1/trust2     ~ actor*partner | group, data = supportive, na.rm = TRUE)  # Trust

# ---- Harmful friends ----
RR(support1/support2 ~ actor*partner | group, data = harmful, na.rm = TRUE)     # Support
RR(harm1/harm2       ~ actor*partner | group, data = harmful, na.rm = TRUE)     # Harm
RR(listen1/listen2   ~ actor*partner | group, data = harmful, na.rm = TRUE)     # Listening
RR(value1/value2     ~ actor*partner | group, data = harmful, na.rm = TRUE)     # Relationship value
RR(trust1/trust2     ~ actor*partner | group, data = harmful, na.rm = TRUE)     # Trust
