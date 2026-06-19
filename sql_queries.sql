
-- Total Customers
SELECT COUNT(*) AS Total_Customers
FROM Customer_Churn_Analytics_Dataset;

-- Churn Distribution
SELECT c12 AS Churn,
COUNT(*) AS Customer_Count
FROM Customer_Churn_Analytics_Dataset
GROUP BY c12;

-- Contract vs Churn
SELECT c8 AS Contract,
c12 AS Churn,
COUNT(*) AS Customer_Count
FROM Customer_Churn_Analytics_Dataset
GROUP BY c8,c12;

-- Payment Method vs Churn
SELECT c9 AS PaymentMethod,
c12 AS Churn,
COUNT(*) AS Customer_Count
FROM Customer_Churn_Analytics_Dataset
GROUP BY c9,c12;

-- Internet Service Distribution
SELECT c7 AS InternetService,
COUNT(*) AS Customer_Count
FROM Customer_Churn_Analytics_Dataset
GROUP BY c7;

-- Senior Citizen vs Churn
SELECT c3 AS SeniorCitizen,
c12 AS Churn,
COUNT(*) AS Customer_Count
FROM Customer_Churn_Analytics_Dataset
GROUP BY c3,c12;

-- Average Monthly Charges
SELECT ROUND(AVG(c10),2) AS Avg_Monthly_Charges
FROM Customer_Churn_Analytics_Dataset;

-- Average Tenure
SELECT ROUND(AVG(c6),2) AS Avg_Tenure_Months
FROM Customer_Churn_Analytics_Dataset;




















/
CREATE OR REPLACE TRIGGER block_enp_sunday
BEFORE INSERT OR UPDATE OR DELETE ON enp
BEGIN
    IF TO_CHAR(SYSDATE, 'DY') = 'SUN' THEN
        RAISE_APPLICATION_ERROR(-2001, 'No operations allowed on ENP table on Sunday.');
    END IF;
END;
/
Output:

ERROR 1064 (42000) at line 1: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'TRIGGER block_enp_sunday
BEFORE INSERT OR UPDATE OR DELETE ON enp
BEGIN
    IF T' at line 1

