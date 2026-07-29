-- ============================================================
-- Fraud Detection Rule Audit — SQL Queries
-- Author: Rodolfo Tan
-- Description: Transaction data analysis for fraud detection
-- ============================================================

-- Query 1: Explore the dataset
-- What are the column names?
SELECT *
FROM transaction_data;

-- Query 2: Zip code filter
-- Find the full_names and emails
-- of the transactions listing 20252 as the zip code.
SELECT full_name, email
FROM transaction_data
WHERE zip = 20252;

-- Query 3: Name-based search
-- Use a query to find the names
-- and emails associated with these transactions.
SELECT full_name, email
FROM transaction_data
WHERE full_name = 'Art Vandelay'
   OR full_name LIKE '%der%';

-- Query 4: IP address filter
-- Find the ip_addresses and emails listed with these transactions.
SELECT ip_address, email
FROM transaction_data
WHERE ip_address LIKE '10%';

-- Query 5: Suspicious email domain
-- Find the emails in transaction_data with
-- 'temp_email.com' as a domain.
SELECT email
FROM transaction_data
WHERE email LIKE '%temp_email.com%';

-- Query 6: Combined IP and name filter
-- The finance department is looking for a specific transaction.
-- They know that the transaction occurred from an ip address starting
-- with '120.' and their full name starts with 'John'.
SELECT *
FROM transaction_data
WHERE ip_address LIKE '120%'
  AND full_name LIKE 'John%';

-- Query 7: Geographic filter — Georgia residents
-- Return only those customers residing in GA.
-- Source: https://en.wikipedia.org/wiki/List_of_ZIP_Code_prefixes
-- Georgia ZIP code range: 30002 to 39901
SELECT *
FROM transaction_data
WHERE zip BETWEEN 30002 AND 39901;
