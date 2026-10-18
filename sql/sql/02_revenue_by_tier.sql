-- ============================================================
-- Title: Revenue Scaling & Marketing Spend Efficiency
-- Description: Analyzes revenue generation, company size scaling, and marketing spend drag on expired contracts
-- Dialect: Google BigQuery Standard SQL
-- ============================================================

-- 1. Revenue and Marketing Spend by Company Size and Contract Status
SELECT 
  Company_Size,
  Contract_Status,
  COUNT(*) AS company_count,
  ROUND(AVG(`Annual_Revenue _M__`), 2) AS avg_revenue_m,
  -- Spend converted to Millions ($M) to match Revenue scale
  ROUND(AVG(`Marketing_Spend _K__`) / 1000, 3) AS avg_marketing_spend_m
FROM `thematic-coda-505812-a0.b2b_crm.companies_clean_734`
GROUP BY Company_Size, Contract_Status
ORDER BY Company_Size, company_count DESC;
-- 2. Deep-Dive: Total wasted marketing spend ($M) on churned accounts
SELECT 
  Company_Size,
  COUNT(*) AS churned_company_count,
  ROUND(SUM(`Marketing_Spend _K__`) / 1000, 3) AS total_lost_marketing_spend_m,
  ROUND(SUM(`Annual_Revenue _M__`), 2) AS lost_annual_revenue_m
FROM `thematic-coda-505812-a0.b2b_crm.companies_clean_734`
WHERE Contract_Status = 'Expired'
GROUP BY Company_Size
ORDER BY total_lost_marketing_spend_m DESC;
