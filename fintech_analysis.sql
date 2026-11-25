CREATE DATABASE fintech_analysis;
USE fintech_analysis;

SHOW DATABASES;

USE fintech_analysis;

SELECT COUNT(*) FROM transactions_new;
USE fintech_analysis;

SELECT COUNT(*) AS total_records
FROM transactions;

USE fintech_analysis;
SHOW TABLES;

DESCRIBE cleaned_fraud_transactions;

SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';

USE fintech_analysis;

CREATE TABLE transactions_new LIKE transactions;

SELECT COUNT(*) 
FROM cleaned_fraud_transactions;
SHOW VARIABLES LIKE 'local_infile';


SHOW VARIABLES LIKE 'secure_file_priv';

SHOW CREATE TABLE cleaned_fraud_transactions;

USE fintech_analysis;

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned_fraud_transactions.csv'
INTO TABLE cleaned_fraud_transactions
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) AS total_records
FROM cleaned_fraud_transactions;

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT trans_date_trans_time, cc_num, merchant, amt) AS unique_transactions
FROM cleaned_fraud_transactions;

CREATE TABLE fintech_backup AS
SELECT * FROM cleaned_fraud_transactions;

USE fintech_analysis;

SHOW TABLES;

SELECT COUNT(*) AS backup_rows
FROM fintech_backup;

CREATE TABLE fintech_clean AS
SELECT DISTINCT *
FROM cleaned_fraud_transactions;

SELECT COUNT(*) AS total_rows
FROM fintech_clean;

CREATE TABLE fintech_final LIKE cleaned_fraud_transactions;

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned_fraud_transactions.csv'
INTO TABLE fintech_final
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) AS total_records
FROM fintech_final;

-- 1)Objective: Find how many transactions each customer (cardholder) has made.
SELECT
    cc_num,
    COUNT(*) AS total_transactions
FROM fintech_final
GROUP BY cc_num
ORDER BY total_transactions DESC;

-- Q2 — Average Transaction Amount per Customer
SELECT
    cc_num,
    COUNT(*) AS total_transactions,
    ROUND(AVG(amt), 2) AS avg_transaction_amount
FROM fintech_final
GROUP BY cc_num
ORDER BY avg_transaction_amount DESC;

-- Q3 — Top Merchants by Transaction Volume
SELECT
    merchant,
    COUNT(*) AS total_transactions,
    ROUND(SUM(amt), 2) AS total_revenue
FROM fintech_final
GROUP BY merchant
ORDER BY total_transactions DESC
LIMIT 10;


-- Q4 — Customers with Frequent Fraudulent Transactions
SELECT
    cc_num,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(SUM(is_fraud) * 100.0 / COUNT(*), 2) AS fraud_rate_percentage
FROM fintech_final
GROUP BY cc_num
HAVING SUM(is_fraud) > 0
ORDER BY fraud_transactions DESC, fraud_rate_percentage DESC;


-- Q5 — Hour-wise & Weekday-wise Fraud Trends
SELECT
    HOUR(trans_date_trans_time) AS transaction_hour,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions
FROM fintech_final
GROUP BY HOUR(trans_date_trans_time)
ORDER BY fraud_transactions DESC;

-- Q6 — High-Risk Customer Identification
WITH customer_risk AS (
    SELECT
        cc_num,
        COUNT(*) AS total_transactions,
        SUM(is_fraud) AS fraud_transactions,
        ROUND(SUM(is_fraud) * 100.0 / COUNT(*), 2) AS fraud_rate
    FROM fintech_final
    GROUP BY cc_num
    HAVING COUNT(*) >= 20
)
SELECT
    cc_num,
    total_transactions,
    fraud_transactions,
    fraud_rate,
    CASE
        WHEN fraud_rate > 0.77 THEN 'High Risk'
        WHEN fraud_rate > 0.38 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_category
FROM customer_risk
ORDER BY fraud_rate DESC, fraud_transactions DESC;

-- Q7 — Fraud Comparison Across Categories
SELECT
    category,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(SUM(is_fraud) * 100.0 / COUNT(*), 3) AS fraud_rate_percentage,
    ROUND(SUM(amt), 2) AS total_transaction_amount
FROM fintech_final
GROUP BY category
ORDER BY fraud_rate_percentage DESC;

-- Q8 — Customers with Zero Fraudulent Transactions
SELECT
    cc_num,
    COUNT(*) AS total_transactions,
    ROUND(SUM(amt), 2) AS total_amount,
    ROUND(AVG(amt), 2) AS avg_transaction_amount
FROM fintech_final
GROUP BY cc_num
HAVING SUM(is_fraud) = 0
ORDER BY total_transactions DESC;