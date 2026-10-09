# Cyclistic Bike-Share Analysis | 2025

**SQL analysis · Tableau storytelling · Business recommendations**

[**Explore the interactive Tableau Story**](https://public.tableau.com/shared/CRS5Q8WRT?:display_count=n&:origin=viz_share_link) · [SQL analysis](sql/analysis_queries.sql) · [All 13 Tableau screenshots](tableau/screenshots/)

## Executive summary

This case study uses approximately **5.55 million cleaned 2025 bike-share trips**, as described in the original project, to compare **casual riders** and **annual members** and identify opportunities for membership marketing.

**Business question:** How do the two rider groups use bike-share differently, and when or where should Cyclistic test membership promotion?

The analysis highlights differences in **day of week, time of day, trip duration, seasonal activity and station demand**. These patterns support testable marketing ideas, not claims of guaranteed membership conversion.

## Project at a glance

| Scope | Details |
|---|---|
| Study period | January–December 2025 |
| Analytical dataset | Approximately 5.55 million rides after cleaning (project-reported) |
| Tools | SQL / SQLite, Tableau Public, Excel / Google Sheets |
| Dimensions | Rider type, month, day, hour, station, bike type, trip duration |
| Deliverables | Interactive Tableau Story, SQL query library, 13 screenshots |

## Tableau preview

[![Cyclistic Executive Summary](tableau/screenshots/02_executive_summary.png)](https://public.tableau.com/shared/CRS5Q8WRT?:display_count=n&:origin=viz_share_link)

[![Cyclistic Recommendations](tableau/screenshots/13_recommendations.png)](https://public.tableau.com/shared/CRS5Q8WRT?:display_count=n&:origin=viz_share_link)

**[Open the full interactive Tableau Story →](https://public.tableau.com/shared/CRS5Q8WRT?:display_count=n&:origin=viz_share_link)**

## Key analytical findings

| Observed pattern | Potential business implication |
|---|---|
| Casual riders show stronger **weekend** activity | Test weekend membership messages |
| Members have stronger **weekday and commuting-hour** patterns | Position memberships around consistent daily travel |
| Casual activity grows during **warmer months** | Schedule experiments during periods of high casual activity |
| Casual rides are generally **longer** | Explore leisure-oriented messaging |
| Electric bikes are popular across rider types | Test messaging about electric-bike convenience |
| A subset of stations has particularly high ride volumes | Pilot station-level promotions while accounting for rider mix |

Trip patterns do not reveal individual motivations, prove that a given ride was a commute, or show who later bought a membership.

## Recommendations as measurable experiments

1. **Weekend/seasonal marketing:** Pilot promotion during casual-use peaks, with a control group; evaluate attributable membership sign-ups.
2. **Station-focused outreach:** Compare sign-up rates at high-casual-usage stations with similar untreated locations.
3. **Membership positioning:** A/B test reliable commuting versus flexible electric-bike benefits; measure conversion and retention.
4. **Understand repeat usage before targeting individuals:** Obtain appropriate consent-based customer or campaign data. The trip-level information described here is insufficient to reliably identify repeat casual riders.

These are proposed experiments, not proven drivers of membership growth.

## Data preparation and SQL

The documented preparation workflow combined 2025 monthly files, removed observations with missing required station, rider or bike-type information, discarded non-positive trip durations and created a cleaned SQLite table named `tripdata_2025_clean`.

[**Browse SQL queries →**](sql/analysis_queries.sql)

Queries cover trip counts, rider segmentation, hourly/weekly/monthly patterns, bike types, ride lengths, station rankings and rider-type percentage shares. The station-by-rider-type queries now use separate top-ten rankings within each rider group.

**How to run:** Open an SQLite database that already contains `tripdata_2025_clean` in SQLite or DB Browser for SQLite, then execute the relevant queries from `sql/analysis_queries.sql`.

**Reproducibility boundary:** The raw monthly files, database and full file-combination pipeline are **not included** in this repository. The supplied SQL script demonstrates analysis against an existing cleaned table, not a complete build of the dataset.

## Limitations

- Excluding missing-station records may affect comparisons of station activity or rider mix.
- No documented rider-level identity, campaign exposure, conversion outcome or travel purpose means these analyses cannot establish actual membership-conversion effects.
- The ~5.55 million ride count comes from the existing project documentation; the raw dataset is not committed here for independent verification.
- The exact original dataset source and reuse terms should be linked before redistributing raw records.
- One year of results should not be taken as proof of recurring seasonal patterns.

## Repository layout

```text
cyclistic-bike-share-analysis/
├── README.md
├── sql/
│   └── analysis_queries.sql
└── tableau/
    └── screenshots/
        ├── 01_business_question.png
        ├── 02_executive_summary.png
        ├── ...
        └── 13_recommendations.png
```

**Skills demonstrated:** SQL aggregation, SQLite date/time functions, CTEs, window functions, segment comparison, data-quality awareness, Tableau storytelling and business communication.
