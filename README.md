# Cognitive Representations of Supportive and Harmful Relationships



Data, analysis output, and supplemental material for four idiographic key person studies analyzed with the social relations model (SRM).

## Studies and samples

| Study | Relationship | Recruitment | Key persons analyzed | Nominees (supportive / harmful) |
|---|---|---|---|---|
| 1 | Friends | Prolific | 98 | 294 / 294 |
| 2 | Friends | Laboratory (course credit) | 218 | 654 / 654 |
| 3 | Family members | Prolific | 182 | 546 / 546 |
| 4 | Coworkers | Prolific | 177 | 531 / 531 |
| **Total** | | | **675** | **2,025 / 2,025** |

## Design

Each key person (KP) nominated three people who supported them and three who harmed them within one social group. Nominees knew the KP and one another and did not participate. The KP rated every dyadic relationship in both round robins (KP to nominees, nominees to KP, nominees to one another) on five constructs with two indicators each: interpersonal support, interpersonal harm, listening quality, relationship value, and interpersonal trust. Data were analyzed with SOREMO (Kenny & Xuan) and the TripleR package in R.

## Inclusion rules

- All studies: each survey contained four embedded attention-check items (e.g., "Please select 'Never'"). KPs who failed any check, did not consent, or did not complete all dyadic ratings were excluded.
- Study 3: 180 KPs completed the survey and passed all checks; 2 more passed all checks and completed every dyadic rating but stopped before the demographic items. All 182 were analyzed (demographics are missing for 2).
- Study 4: 178 KPs passed all checks; 177 were analyzed.

## Scaling of interpersonal harm

- **Study 1:** 1 = Always, 2 = Often, 3 = Occasionally, 4 = Almost Never, 5 = Never. Higher scores mean *less* harm in the Study 1 data and SOREMO output; signs were reversed when Study 1 harm results were combined with the other studies.
- **Studies 2–4:** 1 = Never to 5 = Always (higher scores mean more harm).
- **All other constructs:** 1 = Much Below Average to 5 = Much Above Average.

## Replication with TripleR

All SRM results can be reproduced in R with the TripleR package (Schönbrodt, Back, & Schmukle). Each construct is a latent variable with two indicators:

```r
RR(support1/support2 ~ actor*partner | group, data = supportive, na.rm = TRUE)
```

One script per study is in `R/`. From the repository folder, run, for example:

```
Rscript R/Study1_Friends_TripleR.R
```

The output of each script is in `results/`. TripleR's tests of actor, partner, and relationship variance are one-tailed; tests of covariances are two-tailed.

**Agreement with SOREMO.** `results/TripleR_vs_SOREMO.csv` lists the standardized actor, partner, and relationship variances and the generalized and dyadic reciprocities from both programs for all 40 analyses (4 studies × 2 relationship types × 5 constructs). For 38, every value agrees to within ±.006. The other two differ because of blank ratings in the original files: SOREMO reads a blank as 0, whereas TripleR treats it as missing. Coding the blank as 0 in TripleR reproduces SOREMO exactly. The blanks are:

- Study 1, supportive friends: one harm rating (group 104).
- Study 2, supportive friends: one listening rating (group 49).
- Study 3, harmful family members: items `harm2` and `value2` for the entire round robin of group 245 (this did not change any reported value).

## Data files

`data/soremo_input/` holds the fixed-format text files analyzed by SOREMO. Each round robin has four lines (A = key person; B, C, D = nominees). Columns 1–3 hold the group number and column 4 the rater. Columns 5–44 hold the supportive round robin and columns 45–84 the harmful round robin: 10 items × 4 targets, with targets moving fastest (the blank is the self-rating). Remaining columns hold coded demographics.

`data/long/` holds the same ratings in long (dyadic) format for TripleR, one row per directed dyad (12 per round robin and relationship type):

| Column | Meaning |
|---|---|
| `study` | 1–4 |
| `relationship` | Supportive or Harmful |
| `group`, `actor`, `partner` | IDs, unique across studies (e.g., `1_16_A`) |
| `actor_role`, `partner_role` | KP (key person) or Nominee |
| `support1`, `support2` | Interpersonal support |
| `harm1`, `harm2` | Interpersonal harm (Study 1: higher = *less* harm) |
| `listen1`, `listen2` | Listening quality |
| `value1`, `value2` | Relationship value |
| `trust1`, `trust2` | Interpersonal trust |

## Repository contents

| Folder / file | Contents |
|---|---|
| `README.md` | This description |
| `Supplemental_Material.docx` | KP and nominee actor and partner effects, Studies 1–4 |
| `data/soremo_input/`, `data/long/` | Rating data (described above) |
| `R/` | TripleR script for each study |
| `results/` | TripleR output and the TripleR–SOREMO comparison |
| `Study1_Friends/` | SOREMO input and setup files, SOREMO output, SPSS files of KP and nominee effects |
| `Study2_Friends/` | SOREMO output for supportive and harmful friends |
| `Study3_Family/` | De-identified Qualtrics export; SOREMO output |
| `Study4_Coworkers/` | De-identified Qualtrics export; SOREMO output |

