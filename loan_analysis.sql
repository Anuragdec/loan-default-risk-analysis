-- 1. What % of loans defaulted overall? 
select  round(100.00 * sum(case when col_18 = 1 then 1 else 0 end )/ count(*) ,2 ) ||'%' from Loan_default_prediction 

--2. Which loan purpose (e.g., debt consolidation, credit card, home improvement) has the highest default rate?
 SELECT 
  loanpurpose,
  COUNT(*) AS total_loans,
  SUM(CASE WHEN col_18 = 1 THEN 1 ELSE 0 END) AS total_defaults,
  ROUND(100.0 * SUM(CASE WHEN col_18 = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) || '%' AS default_rate
FROM Loan_default_prediction
GROUP BY loanpurpose
ORDER BY default_rate DESC;


-- 3 Is there a relationship between loan amount / interest rate and default rate? (bucket loan amounts into ranges, GROUP BY)

SELECT
    CASE
        WHEN loanamount < 50000 THEN 'Low 50k'
        WHEN loanamount < 150000 THEN 'med 50k - 150k'
        ELSE 'High 150k+'
    END AS loan_bucket,

    CASE
        WHEN interestrate < 10 THEN 'Low Interest'
        WHEN interestrate < 15 THEN 'Medium Interest'
        ELSE 'High Interest'
    END AS interest_bucket,

    COUNT(*) AS total_loans,

    SUM(CASE WHEN col_18 = 1 THEN 1 ELSE 0 END) AS total_defaults,

    ROUND(
        100.0 * SUM(CASE WHEN col_18 = 1 THEN 1 ELSE 0 END) / COUNT(*),
    2) AS default_rate

FROM loan_default_prediction

GROUP BY loan_bucket, interest_bucket
ORDER BY default_rate DESC;



-- 4. Which income bracket defaults most?
 select
CASE
when 
income <70000 then 'low 70-' 
when 
income < 100000 then 'med 70-1l'
else 'high 1l+'
END as income_range 
,
sum(case when col_18 =1 then 1 else 0 end) as total_default,
ROUND(100.0 * SUM(CASE WHEN col_18 = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) || '%' AS default_rate
FROM Loan_default_prediction
group by income_range 
order by default_rate DESC ; 


--5. Rank the top 5 riskiest segments (combine 2 factors, e.g., purpose + income bracket) using a window function.
WITH base AS (
    SELECT
        loanpurpose,

        CASE
            WHEN income < 70000 THEN 'low 70k-'
            WHEN income < 100000 THEN 'med 70k-1l'
            ELSE 'high 1l+'
        END AS income_range,

        SUM(CASE WHEN col_18 = 1 THEN 1 ELSE 0 END) AS total_default,
        COUNT(*) AS total_count,

        ROUND(
            100.0 * SUM(CASE WHEN col_18 = 1 THEN 1 ELSE 0 END) / COUNT(*), 
        2) AS default_rate

    FROM Loan_default_prediction
    GROUP BY loanpurpose,
        CASE
            WHEN income < 70000 THEN 'low 70-'
            WHEN income < 100000 THEN 'med 70-1l'
            ELSE 'high 1l+'
        END
)

SELECT *,
       RANK() OVER (ORDER BY default_rate DESC) AS risk_rank
FROM base
LIMIT 5;
