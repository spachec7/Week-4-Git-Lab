# Week 4: version control and collaboration in RStudio

POLS 4130 · September 22 and 24, 2026

Use **RStudio’s Git pane** for version control and **GitHub in your browser** for sharing and review. The lab builds on Week 3’s visualization work. Setup uses a few commands in **RStudio’s built-in Terminal**. The analysis does not require Quarto.

## Start here

1. Complete section 0 of `Week4_Git_Workshop.md`: Git installation/detection, your commit identity, and authentication.
2. Choose **Path A** to initialize a local folder and push it, or **Path B** to create a GitHub repository and clone it. Use one route for **css-rstudio-practice**.
3. Open **Week4_RStudio_Git_Lab.R** in that practice project. Section 0 contains setup checks; sections 1–15 contain the analysis, practice, and commented solutions.
4. Complete **Path C** as a separate fork-and-clone exercise with the course website template. Return to the analysis `.Rproj` afterward.

Use **Terminal** for commands beginning with `git`. Use the **R Console** for R expressions such as `usethis::use_git_config()`. The command reference `Week4_Git_Terminal.txt` is for copying selected commands into Terminal, one at a time. It is not an R script or a batch script.

- **Tuesday:** setup paths and sections 0–7. Configure Git, connect a repository, then edit, rerun, review, commit, and push an R analysis.
- **Thursday:** sections 8–14. Create a branch in RStudio, review a pull request, merge, pull, and rerun the accepted analysis.

Each meeting lasts 100 minutes. For Tuesday, allow roughly 35 minutes for concepts and setup demonstrations, 50 minutes for guided practice, and 15 minutes for supported work. Complete installation before class when possible. Thursday keeps the existing collaboration sequence. The website exercise only edits its README, so students can practice Git before learning Quarto.

## Files

| File | Purpose |
|---|---|
| `Week4_Git_Workshop.md` | Setup, three starting routes, interface reference, troubleshooting, and sources |
| `Week4_Git_Terminal.txt` | Selected commands to enter in RStudio Terminal, with prerequisites and expected results |
| `starter-project/Week4_RStudio_Git_Lab.R` | Main lab: one R script with numbered demonstrations and practice |
| `starter-project/data/gapminder.csv` | The unchanged Week 3 historical data, 1,704 country-year rows |
| `starter-project/README.md` | Instructions a collaborator can use to rerun the project |
| `starter-project/practice-notes.md` | Short observations and explanations |
| `starter-project/research-question.md` | The question and scope of the analysis |
| `starter-project/conflict-practice.txt` | A clearly labeled text simulation; never run this file as R |
| `starter-project/.gitignore` | RStudio session files and generated output stay local |
| `screenshots/` | Documentation screenshots used in the slides and setup guide |

The top-level `.Rproj` and two original fixture paths remain available for continuity. The analysis lab uses your own initialized or cloned practice project. All examples use historical country-level data; the plot supports description, not a causal claim.

## Before class

Have RStudio, R, Git, a GitHub account, and the `readr`, `dplyr`, and `ggplot2` packages ready. Git must be installed where RStudio can detect it. The setup guide includes one-time identity and sign-in help using RStudio and the browser. Routine Commit, Diff, History, Pull, and Push use the Git pane; initial configuration and first remote setup can use Terminal.

Use your own private practice repository. A partner can review on your screen. For separate-account contributions, the owner must arrange collaborator access. Local editing and commits can continue without the internet after setup; online checks remain unfinished until connection is restored.
