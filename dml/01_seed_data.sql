-- ============================================
-- INSERT DATA INTO DEPARTMENTS
-- ============================================

INSERT INTO Departments
(Department_Name, Location, Phone_Number)
VALUES
('Emergency', 'Ground Floor', '020-1001001'),
('Cardiology', 'First Floor', '020-1001002'),
('Pediatrics', 'First Floor', '020-1001003'),
('Maternity', 'Second Floor', '020-1001004'),
('Surgery', 'Second Floor', '020-1001005'),
('Radiology', 'Ground Floor', '020-1001006'),
('Laboratory', 'Ground Floor', '020-1001007'),
('Pharmacy', 'Ground Floor', '020-1001008'),
('Dental', 'First Floor', '020-1001009'),
('Dermatology', 'First Floor', '020-1001010'),
('Neurology', 'Second Floor', '020-1001011'),
('Orthopedics', 'Second Floor', '020-1001012'),
('Ophthalmology', 'First Floor', '020-1001013'),
('ENT', 'First Floor', '020-1001014'),
('General Medicine', 'Ground Floor', '020-1001015');

-- ============================================
-- INSERT DATA INTO DOCTORS
-- ============================================

INSERT INTO Doctors
(Doctor_Name, Gender, Specialty, Phone_Number, Email, Hire_Date, Department_ID)
VALUES
('David Kamau','Male','Emergency Medicine','0711000001','david.kamau@gmail.com','2021-03-15', 1),

('Mary Wanjiku', 'Female', 'Cardiology', '0711000002', 'mary.wanjiku@gmail.com', '2020-06-10', 2),

('Peter Mwangi', 'Male', 'Pediatrics', '0711000003', 'peter.mwangi@gmail.com', '2022-01-20', 3),

('Grace Njeri', 'Female', 'Obstetrics and Gynecology', '0711000004', 'grace.njeri@gmail.com', '2019-09-05', 4),

('Samuel Otieno', 'Male', 'General Surgery', '0711000005', 'samuel.otieno@gmail.com', '2018-11-12', 5),

('Anne Achieng', 'Female', 'Radiology', '0711000006', 'anne.achieng@gmail.com', '2021-07-18', 6),

('Brian Kiptoo', 'Male', 'Medical Laboratory', '0711000007', 'brian.kiptoo@gmail.com', '2023-02-14', 7),

('Lucy Muthoni', 'Female', 'Pharmacy', '0711000008', 'lucy.muthoni@gmail.com', '2020-04-22', 8),

('James Maina', 'Male', 'Dentistry', '0711000009', 'james.maina@gmail.com', '2019-05-30', 9),

('Elizabeth Wambui', 'Female', 'Dermatology', '0711000010', 'elizabeth.wambui@gmail.com', '2022-08-16', 10),

('Kevin Ochieng', 'Male', 'Neurology', '0711000011', 'kevin.ochieng@gmail.com', '2017-10-09', 11),

('Catherine Chebet', 'Female', 'Orthopedics', '0711000012', 'catherine.chebet@gmail.com', '2021-12-01', 12),

('Daniel Kariuki', 'Male', 'Ophthalmology', '0711000013', 'daniel.kariuki@gmail.com', '2020-02-17', 13),

('Esther Nyambura', 'Female', 'ENT', '0711000014', 'esther.nyambura@gmail.com', '2023-06-05', 14),

('Joseph Karanja', 'Male', 'General Medicine', '0711000015', 'joseph.karanja@gmail.com', '2018-03-25', 15);

-- ============================================
-- INSERT DATA INTO PATIENTS
-- ============================================

INSERT INTO Patients
(Patient_Name, Gender, Date_of_Birth, Blood_Group, Phone_Number, Email)
VALUES
('John Mwangi', 'Male', '1995-04-12', 'O+', '0722000001', 'john.mwangi@gmail.com'),

('Jane Wambui', 'Female', '1988-09-25', 'A+', '0722000002', 'jane.wambui@gmail.com'),

('Michael Otieno', 'Male', '1979-02-18', 'B+', '0722000003', 'michael.otieno@gmail.com'),

('Sarah Njeri', 'Female', '2001-07-30', 'O-', '0722000004', 'sarah.njeri@gmail.com'),

('Robert Kamau', 'Male', '1990-11-06', 'AB+', '0722000005', 'robert.kamau@gmail.com'),

('Mercy Achieng', 'Female', '1997-05-14', 'A-', '0722000006', 'mercy.achieng@gmail.com'),

('Daniel Kiptoo', 'Male', '1985-12-22', 'B-', '0722000007', 'daniel.kiptoo@gmail.com'),

('Faith Wanjiku', 'Female', '1993-03-09', 'O+', '0722000008', 'faith.wanjiku@gmail.com'),

('George Maina', 'Male', '1975-08-17', 'A+', '0722000009', 'george.maina@gmail.com'),

('Esther Nyambura', 'Female', '1999-01-28', 'B+', '0722000010', 'esther.nyambura@gmail.com'),

('Patrick Ochieng', 'Male', '1982-06-11', 'O+', '0722000011', 'patrick.ochieng@gmail.com'),

('Lucy Chebet', 'Female', '1991-10-03', 'AB-', '0722000012', 'lucy.chebet@gmail.com'),

('Samuel Kariuki', 'Male', '2000-02-26', 'A+', '0722000013', 'samuel.kariuki@gmail.com'),

('Caroline Muthoni', 'Female', '1987-04-19', 'O-', '0722000014', 'caroline.muthoni@gmail.com'),

('Brian Karanja', 'Male', '1996-09-07', 'B+', '0722000015', 'brian.karanja@gmail.com');

-- ============================================
-- INSERT DATA INTO MEDICINES
-- ============================================

INSERT INTO Medicines
(Medicine_Name, Price)
VALUES
('Paracetamol', 50.00),
('Amoxicillin', 120.00),
('Ibuprofen', 80.00),
('Metformin', 150.00),
('Amlodipine', 100.00),
('Azithromycin', 200.00),
('Omeprazole', 90.00),
('Cetirizine', 60.00),
('Ciprofloxacin', 180.00),
('Diclofenac', 110.00),
('Losartan', 130.00),
('Salbutamol', 75.00),
('Fluconazole', 160.00),
('Doxycycline', 140.00),
('Hydrochlorothiazide', 95.00);

-- ============================================
-- INSERT DATA INTO APPOINTMENTS
-- ============================================

INSERT INTO Appointments
(Patient_ID, Doctor_ID, Appointment_Date, Appointment_Time, Status)
VALUES
(1, 2, '2026-08-20', '09:00:00', 'Scheduled'),

(2, 5, '2026-08-20', '09:30:00', 'Completed'),

(3, 1, '2026-08-21', '10:00:00', 'Scheduled'),

(4, 4, '2026-08-21', '10:30:00', 'Completed'),

(5, 11, '2026-08-22', '11:00:00', 'Scheduled'),

(6, 6, '2026-08-22', '11:30:00', 'Cancelled'),

(7, 12, '2026-08-23', '09:00:00', 'Scheduled'),

(8, 3, '2026-08-23', '09:30:00', 'Completed'),

(9, 9, '2026-08-24', '10:00:00', 'Scheduled'),

(10, 10, '2026-08-24', '10:30:00', 'Completed'),

(11, 15, '2026-08-25', '11:00:00', 'Scheduled'),

(12, 7, '2026-08-25', '11:30:00', 'Cancelled'),

(13, 13, '2026-08-26', '09:00:00', 'Scheduled'),

(14, 14, '2026-08-26', '09:30:00', 'Completed'),

(15, 8, '2026-08-27', '10:00:00', 'Scheduled');

-- ============================================
-- INSERT DATA INTO PATIENT_MEDICATION
-- ============================================

INSERT INTO Patient_Medication
(Patient_ID, Medicine_ID, Dosage, Duration_days)
VALUES
(1, 1, '500mg twice daily', 5),

(1, 2, '250mg three times daily', 7),

(2, 3, '400mg twice daily', 5),

(2, 7, '20mg once daily', 14),

(3, 4, '500mg once daily', 30),

(3, 5, '10mg once daily', 30),

(4, 6, '500mg once daily', 5),

(5, 8, '10mg once daily', 7),

(6, 9, '500mg twice daily', 7),

(7, 10, '50mg twice daily', 5),

(8, 11, '50mg once daily', 14),

(9, 12, '2 puffs twice daily', 10),

(10, 13, '150mg once daily', 7),

(11, 14, '100mg twice daily', 10),

(12, 15, '25mg once daily', 14);

-- ============================================
-- INSERT DATA INTO PRESCRIPTIONS
-- ============================================

INSERT INTO Prescriptions
(Patient_ID, Doctor_ID)
VALUES
(1, 2),
(2, 5),
(3, 1),
(4, 4),
(5, 11),
(6, 6),
(7, 12),
(8, 3),
(9, 9),
(10, 10),
(11, 15),
(12, 7),
(13, 13),
(14, 14),
(15, 8);

-- ============================================
-- INSERT DATA INTO BILLING
-- ============================================

INSERT INTO Billing
(Patient_ID, Appointment_ID, Amount, Payment_Method, Payment_Status)
VALUES
(1, 1, 2500.00, 'Cash', 'Paid'),

(2, 2, 4500.00, 'Mobile Money', 'Paid'),

(3, 3, 3000.00, 'Card', 'Pending'),

(4, 4, 5500.00, 'Insurance', 'Paid'),

(5, 5, 7000.00, 'Mobile Money', 'Paid'),

(6, 6, 2000.00, 'Cash', 'Pending'),

(7, 7, 6500.00, 'Insurance', 'Paid'),

(8, 8, 3500.00, 'Card', 'Paid'),

(9, 9, 1800.00, 'Cash', 'Pending'),

(10, 10, 4000.00, 'Mobile Money', 'Paid'),

(11, 11, 5000.00, 'Insurance', 'Paid'),

(12, 12, 2500.00, 'Cash', 'Pending'),

(13, 13, 6000.00, 'Card', 'Paid'),

(14, 14, 3200.00, 'Mobile Money', 'Paid'),

(15, 15, 4500.00, 'Insurance', 'Pending');
