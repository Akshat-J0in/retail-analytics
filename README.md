# 🛒 End-to-End Retail Sales Analytics

A full-stack data analytics project built on real-world UK e-commerce data, demonstrating an end-to-end analytics pipeline from raw data ingestion to interactive business dashboards.

---

## 📊 Project Overview

This project simulates a real-world data analytics workflow where raw transactional data is cleaned, modelled, warehoused, queried, and visualised — using the same tools and architecture used by data teams in modern companies.

**Dataset:** [Online Retail II UCI](https://www.kaggle.com/datasets/mashlyn/online-retail-ii-uci) — 1M+ rows of UK-based e-commerce transactions (2009–2011)

---

## 🏗️ Architecture

```
Raw CSV (1M+ rows)
      ↓
Python (Pandas + NumPy)     ← Clean, transform, engineer features
      ↓
MS SQL Server               ← Star schema (operational store)
      ↓
Google BigQuery             ← Cloud warehouse (analytical queries)
      ↓
Power BI                    ← Executive dashboard
```

---

## 🔧 Tech Stack

| Tool | Purpose |
|---|---|
| Python (Pandas, NumPy) | Data cleaning & feature engineering |
| MS SQL Server + SSMS | Relational star schema design |
| SQLAlchemy + pyodbc | Python → MS SQL connection |
| Google BigQuery | Cloud analytical warehouse |
| google-cloud-bigquery | Python → BigQuery connection |
| Power BI | Interactive dashboard |
| Git + GitHub | Version control |

---

## 📁 Project Structure

```
retail_analytics/
├── data/                        # Raw and cleaned data (gitignored)
│   ├── online_retail_II.csv
│   └── retail_cleaned.csv
├── sql/
│   ├── create_tables.sql        # MS SQL Server star schema DDL
│   ├── create_database.sql      # MS SQL database creation
│   └── bigquery_queries.sql     # Analytical SQL queries
├── main.ipynb                   # Main analysis notebook
├── retail_analytics_powerbi.pbix # Power BI dashboard
├── requirements.txt
├── .env                         # Credentials (gitignored)
├── .gitignore
└── README.md
```

---

## 📐 Star Schema Design

```
dim_customer       dim_product
      \                /
       \              /
        fact_sales
              |
          dim_date
```

| Table | Rows | Description |
|---|---|---|
| fact_sales | 805,549 | All transactions with foreign keys |
| dim_customer | 5,878 | Unique customers and countries |
| dim_product | 4,631 | Unique products and descriptions |
| dim_date | 34,585 | Unique datetimes with date parts |

---

## 🔍 Key Business Insights

- 🇬🇧 **United Kingdom** generates 83% of total revenue (£14.7M out of £17.7M)
- 📦 **REGENCY CAKESTAND 3 TIER** is the top product by revenue (£286K)
- 📅 **Thursday** is the highest revenue day (£3.84M) — confirming B2B nature of the business
- 🚫 **Saturday** generates near-zero revenue (£9,803) — businesses don't order on weekends
- 📈 **November** consistently peaks across all years — driven by pre-Christmas demand

---

## 🚀 How to Run

### Prerequisites
- Python 3.8+
- MS SQL Server (Express edition works)
- Google Cloud account with BigQuery enabled
- Power BI Desktop

### Setup

1. **Clone the repository**
```bash
git clone https://github.com/Akshat-J0in/retail-analytics.git
cd retail-analytics
```

2. **Install dependencies**
```bash
pip install -r requirements.txt
```

3. **Set up environment variables**

Create a `.env` file in the root folder:
```
BQ_CREDENTIALS_PATH=your-service-account-key.json
```

4. **Download the dataset**

Download [Online Retail II UCI](https://www.kaggle.com/datasets/mashlyn/online-retail-ii-uci) and place it in the `data/` folder.

5. **Run the notebook**

Open `main.ipynb` and run all cells in order:
- Phase 1 → Data cleaning
- Phase 2 → MS SQL loading
- Phase 3 → BigQuery loading and queries
- Phase 4 → Open `retail_analytics_powerbi.pbix` in Power BI Desktop

---

## 📊 Dashboard Preview

The Power BI dashboard includes:

**Page 1 — Sales Overview**
- KPI cards: Total Revenue, Total Invoices, Total Customers, Average Order Value
- Revenue by Country bar chart
- Revenue by Year line chart
- Monthly Revenue Trend
- Daily Revenue Trend

**Page 2 — Product Performance**
- Top 10 Products by Revenue
- Top 10 Products by Quantity Sold

---

## 🔐 Security

- BigQuery service account credentials are stored locally and excluded via `.gitignore`
- Environment variables managed via `.env` file (also gitignored)
- Never commit credential files to version control

---

## 👤 Author

**Akshat**  
[GitHub](https://github.com/Akshat-J0in)
