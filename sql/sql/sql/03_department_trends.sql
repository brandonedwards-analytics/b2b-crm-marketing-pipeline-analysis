-- ============================================================
-- Title: Engagement Trends across Departments & Seniority Levels
-- Description: Evaluates campaign responsiveness, event attendance, and decision-maker influence
-- Dialect: Google BigQuery Standard SQL
-- ============================================================

-- 1. Campaign Responsiveness by Department and Seniority Level
SELECT
  Department,
  Seniority_Level,
  COUNT(*) AS contact_count,
  ROUND(AVG(`Campaign_Response_Rate _%_`), 2) AS avg_campaign_response_rate,
  ROUND(AVG(Event_Attendance), 2) AS avg_event_attendance,
  ROUND(AVG(Influence_Score), 2) AS avg_influence_score
FROM `thematic-coda-505812-a0.b2b_crm.employees_clean_5234`
GROUP BY Department, Seniority_Level
ORDER BY Department, avg_campaign_response_rate DESC;
-- 2. Deep-Dive: Response rate breakdown by decision-maker authority
SELECT
  Department,
  Decision_Maker_Flag,
  COUNT(*) AS contact_count,
  ROUND(AVG(`Campaign_Response_Rate _%_`), 2) AS avg_campaign_response_rate
FROM `thematic-coda-505812-a0.b2b_crm.employees_clean_5234`
GROUP BY Department, Decision_Maker_Flag
ORDER BY Department, Decision_Maker_Flag DESC;
