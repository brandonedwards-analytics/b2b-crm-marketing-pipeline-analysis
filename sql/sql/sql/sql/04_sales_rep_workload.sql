-- ============================================================
-- Title: Sales Rep Account Allocation & Churn Concentration Risk
-- Description: Isolates account volume, high-value enterprise distribution, and revenue loss per rep
-- Dialect: Google BigQuery Standard SQL
-- ============================================================

-- 1. Account Distribution and Retention Rate per Sales Rep
SELECT
  Sales_Rep,
  COUNT(*) AS total_accounts,
  -- High-Value Accounts (Large Tier)
  COUNTIF(Company_Size = 'Large') AS large_enterprise_accounts,
  -- Revenue
  ROUND(SUM(`Annual_Revenue _M__`), 2) AS total_revenue_m,
  ROUND(AVG(`Annual_Revenue _M__`), 2) AS avg_account_size_m,
  -- Churn & Retention Risk
  COUNTIF(Contract_Status = 'Expired') AS expired_churned_accounts,
  COUNTIF(Contract_Status = 'Active') AS active_accounts,
  ROUND(COUNTIF(Contract_Status = 'Active') / COUNT(*) * 100, 1) AS retention_rate_pct
FROM `thematic-coda-505812-a0.b2b_crm.companies_clean_734`
GROUP BY Sales_Rep
ORDER BY large_enterprise_accounts DESC, total_revenue_m DESC;
-- 2. Deep-Dive: Identifying sales reps managing an over-concentrated churn volume
SELECT
  Sales_Rep,
  COUNT(*) AS total_accounts,
  COUNTIF(Contract_Status = 'Expired') AS churned_accounts,
  ROUND(SUM(CASE WHEN Contract_Status = 'Expired' THEN `Annual_Revenue _M__` ELSE 0 END), 2) AS churned_revenue_m
FROM `thematic-coda-505812-a0.b2b_crm.companies_clean_734`
GROUP BY Sales_Rep
HAVING COUNTIF(Contract_Status = 'Expired') > 0
ORDER BY churned_revenue_m DESC;
