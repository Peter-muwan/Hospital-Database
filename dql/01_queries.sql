-- How many patients are registered in the hospital?
SELECT COUNT(*) AS Total_Patients
FROM Patients;

-- What is the total amount billed by the hospital?
SELECT SUM(Amount) AS Total_Billed
FROM Billing;

-- What is the average amount billed for a hospital visit?
SELECT AVG(Amount) AS Average_Billing
FROM Billing;

-- What are the highest and lowest amounts billed by the hospital?
-- Demonstrates MIN and MAX
SELECT
    MIN(Amount) AS Lowest_Bill,
    MAX(Amount) AS Highest_Bill
FROM Billing;

-- How many appointments has each doctor received?
-- Demonstrates GROUP BY
SELECT
    Doctor_ID,
    COUNT(*) AS Total_Appointments
FROM Appointments
GROUP BY Doctor_ID;

-- How much money is associated with each payment method?
-- Demonstrates GROUP BY and SUM
SELECT
    Payment_Method,
    SUM(Amount) AS Total_Amount
FROM Billing
GROUP BY Payment_Method;

-- Which patients have the highest billing amounts?
-- Demonstrates ORDER BY
SELECT
    Patient_ID,
    Amount,
    Payment_Method,
    Payment_Status
FROM Billing
ORDER BY Amount DESC;

-- Which doctors have the most appointments?
-- If doctors have the same number, sort them alphabetically by name.
-- Demonstrates multi-column ORDER BY

SELECT
    Doctors.Doctor_Name,
    COUNT(Appointments.Appointment_ID) AS Total_Appointments
FROM Doctors
LEFT JOIN Appointments
    ON Doctors.Doctor_ID = Appointments.Doctor_ID
GROUP BY Doctors.Doctor_ID, Doctors.Doctor_Name
ORDER BY Total_Appointments DESC, Doctors.Doctor_Name ASC;

-- Which payment methods have total billing amounts greater than KSh 10,000?
-- Demonstrates GROUP BY and HAVING

SELECT
    Payment_Method,
    SUM(Amount) AS Total_Amount
FROM Billing
GROUP BY Payment_Method
HAVING SUM(Amount) > 10000;

-- Which doctors have more than one appointment?
-- Demonstrates GROUP BY and HAVING

SELECT
    Doctor_ID,
    COUNT(Appointment_ID) AS Total_Appointments
FROM Appointments
GROUP BY Doctor_ID
HAVING COUNT(Appointment_ID) > 1;

-- Which billing records are above the average hospital bill?
-- Demonstrates a scalar subquery

SELECT
    Patient_ID,
    Amount,
    Payment_Method,
    Payment_Status
FROM Billing
WHERE Amount > (
    SELECT AVG(Amount)
    FROM Billing
)
ORDER BY Amount DESC;

-- Which doctors have at least one appointment?
-- Demonstrates a correlated subquery

SELECT
    Doctor_ID,
    Doctor_Name,
    Specialty
FROM Doctors d
WHERE EXISTS (
    SELECT 1
    FROM Appointments a
    WHERE a.Doctor_ID = d.Doctor_ID
);

-- View 1: Provides a reusable summary of patient billing information.
CREATE OR REPLACE VIEW Patient_Billing_Summary AS
SELECT
    p.Patient_ID,
    p.Patient_Name,
    b.Billing_ID,
    b.Amount,
    b.Payment_Method,
    b.Payment_Status
FROM Patients p
JOIN Billing b
    ON p.Patient_ID = b.Patient_ID;
    
    -- What billing and payment information is recorded for each patient?
SELECT *
FROM Patient_Billing_Summary;

-- View 2: Provides a reusable summary of doctor appointments.
CREATE OR REPLACE VIEW Doctor_Appointment_Summary AS
SELECT
    d.Doctor_ID,
    d.Doctor_Name,
    d.Specialty,
    p.Patient_ID,
    p.Patient_Name,
    a.Appointment_Date,
    a.Appointment_Time,
    a.Status
FROM Doctors d
JOIN Appointments a
    ON d.Doctor_ID = a.Doctor_ID
JOIN Patients p
    ON a.Patient_ID = p.Patient_ID;
    
    -- Which patients are scheduled to see each doctor, and when?
SELECT *
FROM Doctor_Appointment_Summary
ORDER BY Appointment_Date, Appointment_Time;
