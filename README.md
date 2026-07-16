Loan Default Risk Analysis

A SQL-based analysis of a loan portfolio to identify which borrower and loan characteristics are most associated with default risk.

Objective

Analyze a dataset of loan records to identify which factors — loan purpose, income level, loan amount, and interest rate — are most associated with default risk, and surface actionable risk segments for a lending business.

Dataset


Source: Loan default prediction dataset (Kaggle)
Size: ~2,999 valid records after cleaning, 18 columns
Data quality note: The raw file contained 248,014 fully blank rows (likely an Excel export artifact). These were identified and removed before analysis, retaining 2,999 valid loan records.


Method

SQL techniques used: conditional aggregation (CASE WHEN + SUM), GROUP BY, Common Table Expressions (CTEs), window functions (RANK() OVER), and string concatenation for formatted output.

Key Findings

1. Overall default rate: 12.37% (371 of 2,999 loans)

2. Default rate by loan purpose:

PurposeDefault RateOther14.02%Business13.01%Education12.46%Auto12.15%Home10.35%

Business loans carry the highest interpretable risk among named categories — likely reflecting higher uncertainty in business cash flow versus asset-backed loans like Home.

3. Loan amount × interest rate combined:
The riskiest combination is High loan amount (150k+) + High interest rate, at 18.18% default rate — nearly 3x higher than the safest combination (Low loan amount + Low interest rate, 3.59%). This shows loan amount and interest rate compound each other's risk rather than acting independently.

4. Default rate by income bracket:

Income BracketDefault RateLow (<70k)14.44%Medium (70k-1L)11.49%High (1L+)10.58%

5. Riskiest combined segments (purpose + income, ranked):


Other + Low Income — 17.72%
Education + Low Income — 15.85%
Business + Medium Income — 15.22%
Auto + Low Income — 14.34%
Home + Medium Income — 12.95%


Combining two factors reveals meaningfully sharper risk segments than any single factor alone — the top combined segment (17.72%) is notably higher than the riskiest single factor from loan purpose alone (14.02%).

So What — Business Implications


Loans in the "High amount + High interest" bucket should trigger additional underwriting review — this segment defaults at nearly 5x the rate of the safest bucket.
Low-income borrowers combined with "Other" or "Education" loan purposes represent the highest-risk segment and could warrant tighter approval criteria or additional income verification.
Loan purpose alone is a weak risk signal (10.35%–14.02% range) — income level and loan structure (amount/interest) are stronger standalone predictors, but combining factors sharpens risk identification significantly.


Files


loan_analysis.sql — all 5 queries used in this analysis
Screenshots of query outputs included in this repo
