-- ============================================================
-- Title: Data Cleaning, Quality Assurance & Relational Integrity
-- Description: Duplicate verification, NULL value audits, and multi-table joining
-- Dialect: Google BigQuery Standard SQL
-- ============================================================

-- 1. Duplicate Check (Companies)
SELECT Company_ID, COUNT() AS duplicate_count
FROM thematic-coda-505812-a0.b2b_crm.companies_clean_734
GROUP BY Company_ID
HAVING COUNT() > 1;

-- 2. NULL Value QA Check
SELECT
COUNT(*) - COUNT(Company_ID) AS missing_company_ids,
COUNT(*) - COUNT(Industry) AS missing_industries,
COUNT(*) - COUNT(Region) AS missing_regions
FROM `thematic-coda-505812-a0.b2b_crm.companies_clean_734`;

-- 3. Relational Integrity / Orphan Employee Check
SELECT COUNT(*) AS orphan_employees
FROM `thematic-coda-505812-a0.b2b_crm.employees_clean_5234` AS e
LEFT JOIN `thematic-coda-505812-a0.b2b_crm.companies_clean_734` AS c
ON e.Company_ID = c.Company_ID
WHERE c.Company_ID IS NULL;

-- 4. Complete Dataset Merge Verification
SELECT
e.Employee_ID,
e.Company_ID,
e.Language,
c.Industry,
c.Region
FROM thematic-coda-505812-a0.b2b_crm.employees_clean_5234 AS e
LEFT JOIN thematic-coda-505812-a0.b2b_crm.companies_clean_734 AS c
ON e.Company_ID = c.Company_ID;
