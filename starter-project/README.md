# Life expectancy and income: an RStudio practice project

This project describes the association between GDP per capita and life expectancy across countries in one historical year. The starting script selects 2007. Tuesday's exercise changes the year to 1997. The analysis is descriptive and does not show that income causes a change in life expectancy.

## Run the analysis

1. Open the project's `.Rproj` file in RStudio.
2. Open `Week4_RStudio_Git_Lab.R`.
3. Run the executable code in sections 1, 2, and 6 in order. The other sections guide version-control practice through comments. Source can also run the full script; it only performs the R analysis and saves its output.
4. Read `analysis_year` in section 1 to confirm the selected year. Look for 142 country observations, a five-row continent summary, and the scatterplot.

Required packages: `readr`, `dplyr`, `ggplot2`. Input: `data/gapminder.csv`. Output: `outputs/life-expectancy.png`, recreated by the script and excluded from Git in this project.

## Data and interpretation

The CSV is copied unchanged from our Week 3 materials. It has 1,704 rows: 142 countries observed at 12 five-year intervals from 1952 to 2007. Variables are `country`, `continent`, `year`, `life_exp`, `population`, and `gdp_per_capita`.

Source: [Jenny Bryan's Gapminder teaching extract](https://github.com/jennybc/gapminder). Life expectancy is in years. GDP per capita uses the extract's inflation-adjusted international dollars. Means in the continent table weight countries equally, not by population. These historical values are not current estimates.

## Collaboration

Use RStudio's Git pane to inspect changes and make focused commits. Use a branch for a proposal and a GitHub pull request for review. After an online merge, select local `main`, Pull, and rerun the script. Git history records saved source files; it does not record the live R Environment or prove that an analysis is correct.
