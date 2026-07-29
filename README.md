# Fraud Detection Rule Audit — SQL Project

**Author:** Rodolfo Tan  
**Tools:** SQL, Microsoft Excel  
**Dataset:** transaction_data (30 records, 5 columns)  
**Skills Demonstrated:** Data querying, filtering, pattern matching, data quality validation, anomaly detection

---

## Project Overview

This project simulates a real-world fraud detection audit performed on a transaction database. The goal was to identify suspicious records by writing targeted SQL queries to flag anomalies — including unusual zip codes, suspicious email domains, suspicious IP address patterns, and specific name matches.

This type of work mirrors what data analysts do daily: query large datasets, surface patterns that don't belong, and communicate findings clearly to stakeholders.

---

## Dataset

**Table:** `transaction_data`

| Column | Description |
|---|---|
| `id` | Unique transaction identifier |
| `full_name` | Full name of the user |
| `email` | Email address associated with the transaction |
| `zip` | Postal code of the user |
| `ip_address` | IP address from which the transaction originated |

The dataset contains 30 records including both normal transactions and intentionally flagged records designed to test each detection rule.

---

## SQL Queries

### Query 1 — Explore the Dataset
```sql
SELECT *
FROM transaction_data;
```
**Purpose:** Understand the structure and contents of the table before writing targeted queries.

---

### Query 2 — Suspicious Zip Code
```sql
SELECT full_name, email
FROM transaction_data
WHERE zip = 20252;
```
**Purpose:** Identify transactions originating from zip code 20252, flagged as a high-risk area.  
**Result:** 2 records flagged.

---

### Query 3 — Specific Name Patterns
```sql
SELECT full_name, email
FROM transaction_data
WHERE full_name = 'Art Vandelay'
   OR full_name LIKE '%der%';
```
**Purpose:** Locate transactions associated with a known fraudulent identity and related name patterns.  
**Result:** 3 records flagged.

---

### Query 4 — Suspicious IP Address Range
```sql
SELECT ip_address, email
FROM transaction_data
WHERE ip_address LIKE '10%';
```
**Purpose:** Flag transactions originating from IP addresses beginning with `10.`, a private/internal IP range that should not appear in external transaction data.  
**Result:** 4 records flagged.

---

### Query 5 — Disposable Email Domain
```sql
SELECT email
FROM transaction_data
WHERE email LIKE '%temp_email.com%';
```
**Purpose:** Identify accounts using `temp_email.com`, a known disposable email provider commonly associated with fraudulent accounts.  
**Result:** 4 records flagged.

---

### Query 6 — Combined IP and Name Filter
```sql
SELECT *
FROM transaction_data
WHERE ip_address LIKE '120%'
  AND full_name LIKE 'John%';
```
**Purpose:** Locate a specific transaction flagged by the finance department using two known identifiers — IP address prefix and first name.  
**Result:** 2 records flagged.

---

### Query 7 — Geographic Filter (Georgia Residents)
```sql
SELECT *
FROM transaction_data
WHERE zip BETWEEN 30002 AND 39901;
```
**Purpose:** Identify all transactions from Georgia residents using ZIP code prefix ranges.  
**Source:** [USPS ZIP Code Prefix Reference](https://en.wikipedia.org/wiki/List_of_ZIP_Code_prefixes)  
**Result:** 5 records flagged.

---

## Key Findings

| Rule | Flag Criteria | Records Flagged |
|---|---|---|
| Suspicious zip code | zip = 20252 | 2 |
| Known fraudulent identity | full_name = 'Art Vandelay' or LIKE '%der%' | 3 |
| Internal IP range | ip_address LIKE '10%' | 4 |
| Disposable email domain | email LIKE '%temp_email.com%' | 4 |
| Finance department request | ip LIKE '120%' AND name LIKE 'John%' | 2 |
| Georgia geographic filter | zip BETWEEN 30002 AND 39901 | 5 |

**Total unique flagged records: 15 out of 30 (50% of dataset)**

---

## Files

| File | Description |
|---|---|
| `fraud_detection_queries.sql` | All 7 SQL queries with comments |
| `transaction_data.xlsx` | Sample dataset with 30 records and color-coded fraud flags |

---

## Skills Applied

- `SELECT`, `WHERE`, `LIKE`, `BETWEEN`, `AND`, `OR` clauses
- Pattern matching with wildcard operators
- Multi-condition filtering
- Geographic data analysis using ZIP code ranges
- Data quality validation and anomaly detection
- Structured documentation of findings

---

## About

This project was completed as part of a data analytics portfolio to demonstrate practical SQL skills in a fraud detection context. It reflects the kind of data quality and validation work performed by data analysts and data researchers in financial services, healthcare, and operations environments.
