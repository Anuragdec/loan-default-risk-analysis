# Credit Risk & Collections Diagnostic

An end-to-end analysis identifying which borrower segments are driving default risk in a 255,347-loan portfolio, and what underwriting/collections changes would reduce expected loss.

## Business Question

Is default risk evenly spread across the loan portfolio, or concentrated in specific borrower segments — and if concentrated, where should underwriting or collections focus first?

## Approach

1. **SQL analysis** (SQLite) — segmented the portfolio by employment type, loan purpose, credit score band, and DTI (debt-to-income) band using `CASE WHEN` bucketing, `GROUP BY`, CTEs, and window functions (`RANK() OVER`) to surface the highest-risk combinations.
2. **Power BI dashboard** — rebuilt the segmentation as an interactive dashboard using Power Query (M) for band logic and DAX measures for default rate calculations, including a locked-segment measure (`CALCULATE`) for the headline stat.
3. **Client-style deck** — packaged the finding into a 5-slide recommendation deck (Situation / Findings / Recommendation / Quantified Impact / Next Steps).

## Key Finding

**Unemployed borrowers with poor credit (<580) default at 14.56%** — 1.75x the rate of Full-time + Excellent-credit borrowers (8.32%), and well above the 11% portfolio average.

This is not a small or noisy segment: **32,399 loans, 12.7% of the entire portfolio.**

The finding was confirmed from a second, independent angle — Unemployed + High DTI borrowers default at 14.21% — confirming the risk driver is the borrower profile itself (unemployment + financial stretch), not a single metric.

## Dashboard

![Dashboard screenshot](dashboard-screenshot.png)
*(Replace this with your actual Power BI dashboard screenshot — bar chart, matrix, headline card, and text banner)*

Interactive `.pbix` file: `credit_risk_project.pbix`

## Recommendation

1. **At origination:** tighten underwriting criteria or add income/employment verification for new applications in this segment
2. **On existing loans:** prioritize this segment for proactive collections outreach before accounts reach default

## Quantified Impact

If tightened underwriting/collections brought this segment's default rate down to the portfolio average (11%), that's an estimated **~1,150 fewer defaults** — a **~3.9% reduction in total portfolio defaults**, from this one segment alone.

## Tools Used

SQL (SQLite) — CTEs, window functions, aggregate segmentation
Power BI — Power Query (M), DAX (CALCULATE, DIVIDE), interactive slicers, cross-filtering

## About This Project

This is a self-directed portfolio project, built independently to demonstrate an end-to-end data analysis workflow — from raw data to a business-ready recommendation.

---

## The 90-Second Version (STAR)

**Situation** — I noticed most public credit-risk analysis examples use clean, toy data that doesn't reflect how real lending portfolios behave, so I built one from a realistic 255K-row loan dataset to practice the full workflow end to end.

**Task** — My goal was to identify which borrower segments were driving the portfolio's default rate and turn that into a recommendation a credit risk team could actually act on.

**Action** — I used SQL (CTEs and window functions) to segment defaults by employment type, credit score, and debt-to-income ratio, cross-validated the finding from two independent angles, then rebuilt the analysis as an interactive Power BI dashboard with DAX measures, and packaged it into a 5-slide client-style recommendation deck.

**Result** — The analysis surfaced a segment — Unemployed borrowers with poor credit — defaulting at 1.75x the rate of the safest segment, representing 12.7% of the portfolio. If addressed, this alone could reduce total portfolio defaults by an estimated ~3.9%.
