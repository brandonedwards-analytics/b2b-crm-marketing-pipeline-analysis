# B2B Revenue Performance & Retention Strategy Analysis

## 📌 Executive Summary
This project analyzes account conversion patterns, marketing spend efficiency, and customer retention metrics across 734 B2B client accounts and 5,234 employee contact records. Using **BigQuery SQL**, **Google Sheets**, and **Tableau**, the analysis evaluates revenue drivers, high-churn industry clusters, and sales rep allocation bottlenecks to optimize Revenue Operations (RevOps) strategy.

---

## 🔑 Key Findings
* **Revenue Scaling:** Large companies generate the most revenue ($130M+ average) and are the only company size tier with more active contracts than expired ones.
* **Industry Churn:** Contract expiration is extremely high in Mining, Oil & Gas, and Residential sectors (representing the top revenue loss segment).
* **Marketing Efficiency:** Campaign type and spend levels do not drive major revenue variance across channels; top-tier deals correlate with higher spend regardless of channel.
* **Rep Allocation:** Overall account volume is evenly balanced (~90 accounts per rep), but enterprise account value ($130M+ deals) and churn risk are heavily concentrated in top enterprise reps.

---

## 💡 Strategic Recommendations
1. **High-Yield Industry Focus:** Prioritize Mining, Oil & Gas, and Residential sectors to directly address and reduce contract expiration root causes.
2. **Capitalize on Large Enterprise Accounts:** Continue prioritizing Large companies ($130M+ avg revenue) while implementing targeted pushes to convert pending deals to active status and reduce expirations.
3. **Flexible Channel Marketing:** Maintain target-audience focused marketing across channels, shifting excess spend toward post-sale retention enablement.

---

## 🛠️ Tools & Technologies
* **Database & Querying:** Google BigQuery (Standard SQL, `COUNTIF`, `SAFE_DIVIDE`, Aggregations, Window Functions)
* **Data Processing & QA:** Google Sheets (`PROPER`, `TRIM`, `MEDIAN`, Pivot Tables)
* **Data Visualization:** Tableau Public
* **Documentation & Presentation:** Google Slides & Notion

---

## 📂 Repository Structure
* `sql/01_data_cleaning_qa.sql`: Quality assurance, duplicate verification, and relational integrity.
* `sql/02_revenue_by_tier.sql`: Revenue scaling and marketing spend efficiency by company size.
* `sql/03_department_trends.sql`: Seniority, decision-maker density, and campaign engagement trends.
* `sql/04_sales_rep_workload.sql`: Sales rep workload, enterprise account concentration, and churn distribution.
