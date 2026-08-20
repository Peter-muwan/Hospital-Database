# Hospital Database

Replace everything in brackets. Delete this quote line when you're done.

# NAME                    GITHUB USERNAME                  ROLE ON THIS PROJECT
Niva Achieng              Nivano3ls
Heinze Muhazi             heinze01
# DOMAIN
The domain of this project is hospital management. The database helps organize important hospital information, including patients, doctors, departments, appointments, medicines, prescriptions, and billing records.

Entity-Relationship Diagram



[One or two sentences describing the key relationships — e.g. "A rider can take many trips; each trip belongs to exactly one driver and one rider; trips are linked to a single payment record."]

# SCHEMA SUMMARY

# 1. Departments
- Stores information about hospital departments including department name, location, and phone number.
- Referenced by Doctors.Department_ID.
 
# 3. Doctors
- Stores information about hospital doctors, including their name, gender, specialty, contact details, hire date, and department.
-  Department_ID is an FK to `Departments`. Referenced by Appointments.Doctor_ID and Prescriptions.Doctor_ID.
  
# 4. Patients
- Stores patient information, including their name, gender, date of birth, blood group, phone number, email, and registration date.
- Referenced by Appointments.Patient_ID, Patient_Medication.Patient_ID, Prescriptions.Patient_ID, and Billing.Patient_ID.
  
# 5. Appointments
- Stores appointment information between patients and doctors, including the appointment date, time, and status.
- Patient_ID is an FK to Patients. Doctor_ID is an FK to Doctors. Referenced by Billing.Appointment_ID.
  
# 6. Medicines
- Stores information about medicines available in the hospital, including the medicine name and price.
- Referenced by Patient_Medication.Medicine_ID.

# 8. Patient_Medication
- Acts as a junction table between Patients and Medicines. It records which medicine a patient is taking, including the dosage and duration in days.
- Patient_ID is an FK to Patients. Medicine_ID is an FK to Medicines.

# 10. Prescriptions
- Stores prescription information by linking patients with the doctors who prescribed their medication.
- Patient_ID is an FK to Patients. Doctor_ID is an FK to `Doctors`.

# 12. Billing
- Stores hospital billing information, including the patient, appointment, amount, payment method, and payment status.
- Patient_ID is an FK to `Patients`. Appointment_ID is an FK to Appointments.

# REPOSITORY STRUCTURE

Hospital-Database/
├── README.md
├── ddl/
│   └── 01_schema.sql        -- table definitions, keys, constraints
├── dml/
│   └── 01_seed_data.sql     -- sample data
├── dql/
│   └── 01_queries.sql       -- analytical queries + views
└── docs/
    └── erd.png              -- entity-relationship diagram

# How to Run This Project
Create a fresh database:
CREATE DATABASE Hospital;
USE Hospital;

Run the schema script:
mysql -u root -p Hospital < ddl/01_schema.sql

Load the sample data:
mysql -u root -p Hospital < dml/01_seed_data.sql

Run the queries:
mysql -u root -p Hospital < dql/01_queries.sql

Scripts must be run in this order — DML depends on DDL, DQL depends on DML.

# FEATURED QUERIES

Pick your best 3–4 queries from dql/01_queries.sql and showcase them here — the question they answer and why it matters to the business.

# 1. Which patients have the highest billing amounts?

SELECT
    Patient_ID,
    Amount,
    Payment_Method,
    Payment_Status
FROM Billing
ORDER BY Amount DESC;

# Why it matters: This helps hospital management identify patients with the highest bills and review outstanding or significant payments. 

# 2. How much money is associated with each payment method?

SELECT
    Payment_Method,
    SUM(Amount) AS Total_Amount
FROM Billing
GROUP BY Payment_Method;

# Why it matters: This helps management understand the amount of money associated with each payment method and supports financial analysis.

# 3. Which doctors have the most appointments?

SELECT
    Doctors.Doctor_Name,
    COUNT(Appointments.Appointment_ID) AS Total_Appointments
FROM Doctors
LEFT JOIN Appointments
    ON Doctors.Doctor_ID = Appointments.Doctor_ID
GROUP BY Doctors.Doctor_ID, Doctors.Doctor_Name
ORDER BY Total_Appointments DESC, Doctors.Doctor_Name ASC;

# Why it matters: This helps hospital management monitor doctor workloads and identify doctors handling more appointments.

# VIEWS
# 1. Patient_Billing_Summary 
 What it shows: Shows patient billing information, including patient name, billing amount, payment method, and payment status. 
 Why we made it a view: Makes billing information easier to access without repeatedly writing the Patients-Billing JOIN. |

# 2. Doctor_Appointment_Summary
  What it shows: Shows doctors, their specialties, patients, appointment dates, times, and appointment status. 
  Why we made it a view: Makes appointment information easier to access and provides a reusable summary for hospital management. 


# ASSUMPTIONS & DESIGN DECISIONS
- auto_increment is used for primary keys so that unique IDs can be generated automatically and unique constraints are used for fields such as department names and patient and doctor contact information where duplicate values should not be allowed, also Patients and medicines have a many-to-many relationship because one patient can receive multiple medicines and one medicine can be given to multiple patients.So the Patient_Medication table was therefore created as a junction table.
