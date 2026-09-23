# Week 4: version control and collaboration in RStudio ==========================
# POLS 4130 | September 22 and 24, 2026
# First follow Week4_Git_Workshop.md, sections 0-1. Work in your initialized or cloned practice project.
# Use Run for R, the Git pane for ordinary version control, and Terminal for git commands.
# Each practice: predict, act, inspect, explain. Solutions are commented at end.
# Tuesday: sections 0-7. Thursday: sections 8-14. No Quarto prerequisite.
# Source runs the analysis and saves a plot. It performs no Git operations.

# 0. One-time setup and orientation --------------------------------------------
# Use Week4_Git_Workshop.md to prepare Git, identity, and GitHub sign-in.
# This file belongs in css-rstudio-practice beside its .Rproj file.
# 0A. Git setup: in RStudio's Terminal, run git --version. Complete installation
# if needed, then Tools > Global Options > Git/SVN should detect Git.
# 0B. In Terminal, configure your own name/email once (replace both examples):
# git config --global user.name "Your Name"
# git config --global user.email "you@example.com"
# git config --global init.defaultBranch main
# Verify with git config --get user.name and git config --get user.email.
# These are Terminal commands, not R code. Full commands: Week4_Git_Terminal.txt.
# G00A: Check your configured identity. Explain why it does not sign in to GitHub.
#
# 0C. Guide Path A: copy starter-project to your own new practice folder.
# File > New Project > Existing Directory opens it as an RStudio project.
# Tools > Project Options > Git/SVN > Git initializes its local repository.
# Run sections 1-2 below, then review, stage and Commit the baseline in Git.
# Create an EMPTY GitHub repository, add its URL as origin in Terminal, and use
# git push -u origin main for the first push. The guide supplies exact steps.
# G00B: Check History and GitHub. Explain what initialization, commit, and Push add.
# Guide Path B is the alternative: create a GitHub repo with README, then clone.
# Choose A or B for this analysis, so you do not create competing copies.
#
# 0D. Guide Path C: fork the course website on GitHub, then use RStudio's
# File > New Project > Version Control > Git to clone YOUR fork into a separate
# folder. In that project's Terminal, git remote -v should show your account.
# Personalize only the README heading, then Diff, stage, Commit, Push and check.
# G00C: Name the owner of origin. Did your Push change the instructor's repository?
# Return to this analysis project's .Rproj before continuing below.
# Never paste a token into this script. The R Console helper gitcreds::gitcreds_set()
# accepts it at an interactive prompt if your credential manager needs setup.
# Find the project name at the top right, the Files pane, and the Git tab.
# A repository holds project files and the Git history recorded by commits.
# Version control lets us compare and recover recorded versions. A commit
# records a project snapshot; unchanged files reuse existing stored content.
# The guide includes Pro Git diagrams for snapshots, staging, and branches.
# An .Rproj file gives RStudio its project context; it is not the Git history.
# G01: Explain what initializing adds to a folder, and what cloning supplies
# that downloading a ZIP does not. Use practice-notes.md for your short answers.
# CHECK: README.md is present, the Git tab is visible, and the branch is main.

# 1. Read the same historical data used in Week 3 -------------------------------
library(readr)
library(dplyr)
library(ggplot2)

gapminder <- read_csv("data/gapminder.csv", show_col_types = FALSE)

# EDIT HERE in section 3: change only 2007 to 1997, then rerun sections 1-2.
analysis_year <- 2007

# EDIT THESE LABELS on clarify-labels in section 9.
x_label <- "GDP per capita"
y_label <- "Life expectancy"

# 2. Run the baseline analysis -------------------------------------------------
year_data <- gapminder |>
  filter(year == analysis_year)

continent_summary <- year_data |>
  group_by(continent) |>
  summarise(
    countries = n(),
    mean_life_exp = mean(life_exp),
    .groups = "drop"
  )

nrow(year_data)
continent_summary

life_plot <- ggplot(
  year_data,
  aes(x = gdp_per_capita, y = life_exp, color = continent)
) +
  geom_point(alpha = 0.7) +
  scale_x_log10() +
  labs(
    title = paste("Life expectancy and income in", analysis_year),
    x = x_label,
    y = y_label,
    color = "Continent",
    caption = "Gapminder teaching extract. Each point is one country."
  ) +
  theme_minimal()

print(life_plot)

# G02: Which year does the plot use? How many countries and continent groups?
# CHECK: In 2007, nrow(year_data) is 142 and the summary has five rows.
# EXPLAIN: The log scale changes the spacing of x values, not the stored data.
# A continent mean here gives every country equal weight, not every person.
# If Path A already recorded the baseline, verify it in History and continue.
# Otherwise, before editing: Save. Review the starter files, tick Staged, Commit
# with message "Add baseline R analysis", then Push. See guide section 2.
# Include the .Rproj, .R script, README, .gitignore, data, and practice fixtures.

# 3. A focused revision: save, diff, stage, commit ------------------------------
# PREDICT: What should change if we study 1997 rather than 2007?
# ACT: Change analysis_year above from 2007 to 1997. Save the script.
# Rerun sections 1-2. The plot title and filtered data should both say 1997.
# In Git, select this .R file and click Diff. Find the removed and added lines.
# Tick Staged for this .R file. Inspect the staged diff, enter
# "Compare life expectancy in 1997", and click Commit.
# G03: Explain the difference between the code diff and the changed R results.
# CHECK: nrow(year_data) remains 142; every value in year_data$year is 1997.
# The 1997 Oceania mean is 78.19. A saved edit needs a commit to enter history.
# If you edit again after staging, inspect and stage that later edit too.
# Keep the year at 1997 for the rest of both meetings.

# 4. Read a useful history -----------------------------------------------------
# Open History from the Git pane's clock icon or Git menu.
# Select "Compare life expectancy in 1997" and this .R file.
# G04: Identify the before/after line and explain what the message adds.
# CHECK: History contains the baseline and the year-change commit.
# A clean Git pane means no listed file changes; commits may still need Push.
# Running R does not commit code or preserve Environment objects in Git.

# 5. Share and retrieve through RStudio ----------------------------------------
# Click Push in RStudio. Refresh your repository page on GitHub.
# Select main and open this .R file. Verify analysis_year <- 1997 and the commit.
# G05: Record the branch and message you actually see on GitHub.
# Now open README.md on GitHub, click the edit pencil, and add this final line:
# "Connection check: this line was added on GitHub."
# Commit the browser edit directly to main with message "Add connection check".
# Back in RStudio, first confirm the Git pane has no unfinished file changes.
# Inspect local README: the new line should not be there yet. Click Pull.
# CHECK: The line now appears locally. Pull brought a remote commit into main.
# If Push or Pull fails, read the message and use guide troubleshooting.

# 6. Recreated outputs and ignored local files ---------------------------------
# Run this section after sections 1-2. Look in RStudio's Files pane afterward.
dir.create("outputs", showWarnings = FALSE)
ggsave(
  "outputs/life-expectancy.png",
  plot = life_plot,
  width = 8, height = 5, dpi = 150
)

# G06: The PNG exists in Files. Why does it not appear in the Git pane?
# Open .gitignore and find outputs/. We track the code and shareable input.
# CHECK: The .R script and CSV are tracked; the regenerated PNG is ignored.
# .gitignore does not remove files already tracked or erase past commits.
# A collaborator regenerates this output by running the script.

# 7. Combined application and Tuesday handoff ----------------------------------
# G07: Update README's starting-year explanation to identify 1997 as the current
# analysis. Add one useful interpretation detail from your plot or data summary.
# Do not make a causal claim. Save, Diff, stage, Commit, Push, verify on GitHub.
# Record any remaining short answers in practice-notes.md, then commit and push
# those separately. Leave main clean. This prepares Thursday's starting point.
# CHECK: A reader can find the year, input, how to run, and the historical scope.

# 8. Thursday: begin from accepted work ----------------------------------------
# Reopen this same .Rproj. Confirm main in the Git branch dropdown.
# Complete and commit unfinished edits before continuing. Click Pull.
# Rerun sections 1-2 and 6. Confirm 1997 and 142 countries.
# G08: Explain why checking both the branch and the files matters.
# CHECK: Git lists no pending changes; the title says 1997.
# If Tuesday is incomplete, finish through section 7 first.

# 9. Propose better labels on a branch -----------------------------------------
# In Git, click New Branch (the branch icon beside the branch selector).
# Name it clarify-labels. Select remote origin in the dialog, then Create.
# Confirm clarify-labels in the branch dropdown before editing.
# Change x_label above to "GDP per capita (international dollars)".
# Change y_label above to "Life expectancy (years)".
# Rerun sections 1-2 and 6, Save, inspect Diff, stage this script, then Commit
# with "Clarify plot units" and Push the branch.
# G09: Explain which part of the research output changed and which stayed fixed.
# CHECK: Two labels change. The year stays 1997 and there are still 142 countries.
# Select main in the branch dropdown with a clean Git pane, inspect the older
# labels in the source, then return to clarify-labels. Rerun after switching.
# Branches change saved files, not the existing objects in the R Environment.
# If New Branch differs in your version, use the guide's browser fallback.

# 10. Review the proposal on GitHub --------------------------------------------
# On GitHub, open Compare & pull request (or Pull requests > New pull request).
# Confirm base main and compare clarify-labels.
# Title: "Clarify units in the life expectancy plot".
# Describe the change and check: "Reran the 1997 analysis with 142 countries."
# Create the pull request. Open Files changed with a partner.
# G10: Does the diff include only intended code? Are both labels accurate?
# The author may demonstrate the plot on screen. No file upload is needed.
# Record one reviewer observation in the PR description.
# If revision is needed, edit in RStudio on clarify-labels, rerun, save, stage,
# commit and Push. The same pull request updates automatically.
# CHECK: Only the intended label changes affect the analysis code.
# Your partner can give verbal feedback on your screen. You cannot approve your
# own PR; separate-account review requires repository access. Do not share logins.

# 11. Merge, pull, and verify the accepted analysis -----------------------------
# After review, the owner clicks Merge pull request and confirms on GitHub.
# In RStudio, ensure a clean Git pane, select main, and click Pull.
# Rerun sections 1-2 and 6. Inspect the actual source and the new plot.
# G11: Explain why the online merge alone did not update local main or R objects.
# CHECK: main now has both unit labels, year 1997, and 142 country observations.
# The merged PR is visible online. The branch name locally is main.

# 12. Interpret a conflict (text simulation) ------------------------------------
# Open conflict-practice.txt in RStudio. Do not Source that file.
# G12: The accepted question uses 1997. Replace the entire marker block with:
# analysis_year <- 1997
# Keep the explanation that this is a simulation. Save, review, commit and push.
# CHECK: No marker lines remain in the fixture. Explain your year choice.
# Typed markers do not make Git report an unresolved merge. In a real conflict,
# Git names an unresolved file. Agree on the content, edit out markers, Save,
# stage the resolved file, finish the merge commit, rerun, then Push.
# Ask the instructor for help if a real Pull conflict appears.

# 13. Recover with a visible explanation ---------------------------------------
# Use only the harmless README practice below, starting from clean main.
# A. Add "Temporary recovery note" at the end of README, Save, and inspect Diff.
# Select only README in Git and choose Revert. Confirm only after checking the
# dialog names the intended file. CHECK: The uncommitted note disappears.
# B. Add "Practice year: 2097" to README, Save, stage, and Commit with
# "Add demonstration typo". History now records that mistake.
# Correct the line to "Practice year: 1997", Save, stage, and Commit with
# "Correct demonstration year to 1997". Push.
# G13: Find both commits in History and explain the difference between A and B.
# CHECK: README ends with 1997 and both recorded commits remain in history.
# RStudio's Revert discards selected uncommitted edits. Our committed mistake
# is repaired by a new ordinary commit. We do not rewrite shared history.

# 14. Handoff and independent practice -----------------------------------------
# G14: Ask a partner to locate the question, selected year, data source, run
# instructions, and accepted labels. Rerun the project together in RStudio.
# Add one next task and a concrete success check to practice-notes.md.
# Save, review, commit, Push, and verify main on GitHub.
# CHECK: Another person can explain the project and reproduce its current plot.
# A successful Git operation does not establish a valid analysis.

# 15. Commented solutions and interpretation -----------------------------------
# G00A: Git identity labels commits. GitHub authentication authorizes network access.
# G00B: Initialize creates .git locally; Commit records a snapshot; Push shares
#       recorded commits with an existing connected remote repository.
# G00C: origin should name your account's fork. Push updates that fork.
# G01: Initialize adds Git metadata to an existing folder. Clone obtains files,
#      Git history, and origin from a remote. A ZIP download supplies files.
# G02: Baseline year 2007; 142 countries; five continent groups.
# G03: analysis_year <- 1997. The data and plot change only after rerunning.
#       Still 142 rows; Oceania mean_life_exp = 78.19 in 1997.
# G04: The diff shows the line change; the message explains its purpose.
# G05: Verify main and "Compare life expectancy in 1997" after Push; after the
#       browser edit and Pull, the connection-check line is local too.
# G06: outputs/ matches .gitignore. This lab recreates plots from code and data.
# G07: Say the current comparison uses historical 1997 data and that the plot
#       shows an association. Include the .Rproj/script/data run instructions.
# G08: main is our accepted line of work; Pull brings in online changes.
# G09: x_label <- "GDP per capita (international dollars)"
#       y_label <- "Life expectancy (years)"
#       The proposed labels name units without changing any observations.
# G10: Check labels, scope of diff, and successful rerun; respond to feedback.
# G11: Browser Merge changes online main. Pull updates local main; rerun updates
#       the Environment and plot. All three checks are necessary.
# G12: analysis_year <- 1997 matches the agreed question. Remove all markers.
# G13: Revert discards an uncommitted edit. The correction commit preserves the
#       earlier mistake as well as its explanation and repair.
# G14: Example next task: compare 1997 and 2007. Success check: two clearly
#       labeled plots, 142 countries in each, with no causal interpretation.
# Sources and screenshot credits are in Week4_Git_Workshop.md and README.md.
