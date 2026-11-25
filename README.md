
# 💳 Financial Transaction Intelligence – Customer Behavior & Fraud Risk Analysis

## 📌 Project Overview

This project focuses on analyzing financial transactions to identify fraudulent activities, understand customer transaction behavior, and uncover patterns associated with fraud risk.

Using Python, SQL, and Power BI, the project explores transaction data, performs data analysis, and presents key insights through an interactive dashboard.

The objective is to transform raw transaction data into meaningful insights that can help understand fraud patterns and improve fraud monitoring.

---

## 🎯 Objectives

- Analyze financial transaction patterns.
- Identify fraudulent and legitimate transactions.
- Compare fraud and legitimate transaction amounts.
- Explore fraud trends across transaction categories and locations.
- Analyze transaction patterns across different hours of the day.
- Build an interactive Power BI dashboard for fraud analysis.

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| Python | Data analysis and data processing |
| Pandas | Data cleaning and manipulation |
| NumPy | Numerical operations |
| SQL | Data querying and analysis |
| MySQL | Database management |
| Power BI | Interactive dashboard and visualization |
| Jupyter Notebook | Exploratory data analysis |

---

## 📊 Dataset Overview

The project uses financial transaction data containing information related to transaction amounts, customers, merchants, transaction categories, locations, timestamps, and fraud status.

### Dataset Statistics

- **Total Transactions:** 555,719
- **Fraudulent Transactions:** 2,145
- **Legitimate Transactions:** 553,574
- **Fraud Rate:** Approximately 0.39%
- **Unique Cardholders:** 924
- **Unique Merchants:** 693
- **Transaction Categories:** 14
- **Unique Cities:** 849

---

## 📈 Dashboard Preview

The Power BI dashboard provides an overview of financial transactions and fraud-related patterns.

### Dashboard Features

- Transaction and fraud KPIs
- Fraud vs. legitimate transaction analysis
- Transaction amount analysis
- Category-wise transaction analysis
- Geographical transaction analysis
- Time-based fraud analysis
- Interactive filters and slicers

![FinTech Fraud Analytics Dashboard](Screenshots/FinTech_Fraud_Analytics_Dashboard.png)

---

## 🔍 Key Insights

- Fraudulent transactions represent approximately **0.39%** of total transactions.
- Fraudulent transactions have a significantly higher median transaction amount than legitimate transactions.
- The median fraudulent transaction amount is approximately **$371.94**, compared with **$47.15** for legitimate transactions.
- Fraud transactions show noticeable activity during late-night hours, particularly around **10 PM and 11 PM**.
- Transaction patterns vary across categories, geographical locations, and customer behavior.

---

## 📂 Project Structure

```text
FinTech-Fraud-Analytics/
│
├── Dashboard/
│   └── FinTech_Fraud_Analytics.pbix
│
├── Dataset/
│   └── Supporting analysis files
│
├── Notebook/
│   └── 01_data_understanding.ipynb
│
├── SQL/
│   └── fintech_analysis.sql
│
├── Report/
│   └── FinTech_Fraud_Analytics_Professional_Report.pdf
│
├── Screenshots/
│   └── FinTech_Fraud_Analytics_Dashboard.png
│
├── README.md
└── .gitignore
```

---

## ⚙️ Project Workflow

1. Data loading and inspection
2. Data cleaning and preprocessing
3. Exploratory Data Analysis (EDA)
4. Fraud and legitimate transaction comparison
5. SQL-based data analysis
6. Identification of transaction patterns
7. KPI development and visualization
8. Interactive dashboard creation using Power BI

---

## 📊 Dashboard

The dashboard is designed to provide a clear view of transaction performance and fraud patterns using KPIs, charts, and interactive filters.

It enables users to explore transaction data based on different dimensions and identify trends that may require further investigation.

---

## 🚧 Limitations

- Fraudulent transactions represent a small proportion of the overall dataset.
- The analysis identifies patterns and associations but does not establish the cause of fraud.
- The dashboard is analytical and does not perform real-time fraud detection.
- Findings are based on the available dataset and may not represent all real-world financial transactions.

---

## 🚀 Future Improvements

- Develop a machine learning model for fraud detection.
- Implement anomaly detection techniques.
- Explore advanced customer behavior patterns.
- Develop a real-time fraud monitoring system.
- Improve fraud risk scoring and alert mechanisms.

---

## 👨‍💻 Author

**Vivek Mankar**

BE Information Technology | Data Analytics Enthusiast

---

⭐ If you find this project interesting, feel free to explore the repository.
