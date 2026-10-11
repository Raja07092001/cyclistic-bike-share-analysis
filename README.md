# Cyclistic Bike-Share Analysis

**Rider behavior and membership-growth opportunities | 2025**

**SQL (SQLite) · Tableau Public · Business Analytics**

[**View Interactive Tableau Story**](https://public.tableau.com/shared/CRS5Q8WRT?:display_count=n&:origin=viz_share_link) · [Explore SQL Queries](sql/analysis_queries.sql)

## Business question

**How do casual riders and annual members use Cyclistic differently, and how can these patterns inform membership marketing?**

This case study examines approximately **5.55 million cleaned bike-share trips** recorded during **January–December 2025**, comparing rider behavior by day, hour, month, trip duration, bike type and station.

## Dashboard preview

[![Cyclistic Tableau Story — Executive Summary](tableau/screenshots/02_executive_summary.png)](https://public.tableau.com/shared/CRS5Q8WRT?:display_count=n&:origin=viz_share_link)

*Open the [interactive Tableau Story](https://public.tableau.com/shared/CRS5Q8WRT?:display_count=n&:origin=viz_share_link) to explore the complete analysis.*

## Key findings

| Finding | Business relevance |
|---|---|
| **Casual riders** show stronger weekend activity; **members** use bikes more consistently on weekdays. | Tailor membership messages to different riding occasions. |
| Casual usage rises during warmer months, and casual rides tend to last longer. | Test campaigns during higher-use periods, with leisure-oriented messaging. |
| Members show greater activity around typical commuting hours. | Explore the value of membership for regular travel. |
| Electric bikes are popular with both groups; some stations carry substantial traffic. | Test electric-bike benefits and targeted promotions at suitable locations. |

## Business recommendations

1. **Pilot weekend and warmer-month promotions** where casual activity is relatively high. Measure membership sign-ups against a comparable control group.
2. **Test location-based campaigns** at stations with meaningful casual-rider volumes. Compare conversion rates rather than relying on station traffic alone.
3. **A/B test membership messaging** focused on commuting convenience and electric-bike flexibility; evaluate conversion and retention.

*These recommendations are hypotheses drawn from observed riding patterns, not proven drivers of membership purchases.*

## Approach and tools

- **Preparation:** Combined monthly trip data; excluded records with missing required information or non-positive ride durations.
- **SQL analysis:** Used SQLite aggregations, date/time functions, CTEs and window functions to compare rider segments, time patterns, ride length and station rankings.
- **Visualization:** Built a Tableau Story to communicate rider behavior and practical business opportunities.

**[Review the SQL analysis](sql/analysis_queries.sql)** · **[Browse all Tableau Story screenshots](tableau/screenshots/)**

## Data and reproducibility notes

The ride count is based on the project's documented cleaned dataset. The repository includes the SQL analysis and Tableau screenshots, **not** the raw monthly files or the prebuilt SQLite database. Queries expect an existing table named `tripdata_2025_clean`. The dataset does not include verified campaign conversion outcomes or rider motivations, so it cannot establish the causal effects of proposed marketing actions.

---

**Skills demonstrated:** SQL · SQLite · Data cleaning · Exploratory analysis · Tableau · Data storytelling · Business recommendations
