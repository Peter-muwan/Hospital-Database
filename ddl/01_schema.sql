CREATE DATABASE Hospital;
USE Hospital;

CREATE TABLE Departments (
Department_ID INT AUTO_INCREMENT PRIMARY KEY,
Department_Name VARCHAR (50) NOT NULL UNIQUE,
Location VARCHAR(50),
Phone_Number VARCHAR(50)
);

CREATE TABLE Doctors (
Doctor_ID INT AUTO_INCREMENT PRIMARY KEY,
Doctor_Name VARCHAR (50) NOT NULL,
Gender ENUM ('Male', 'Female'),
Specialty VARCHAR(50) NOT NULL,
Phone_Number VARCHAR(20) UNIQUE,
Email VARCHAR(30) UNIQUE,
Hire_Date DATE NOT NULL,
Department_ID INT NOT NULL,

FOREIGN KEY (Department_ID)
REFERENCES Departments(Department_ID)
);
CREATE TABLE Patients(
Patient_ID INT AUTO_INCREMENT PRIMARY KEY,
Patient_Name VARCHAR(40) NOT NULL,
Gender ENUM ('Male', 'Female'),
Date_of_Birth DATE NOT NULL,
Blood_Group ENUM ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'),
Phone_Number  VARCHAR(20) NOT NULL UNIQUE,
Email VARCHAR(70),
Registration_Date DATE DEFAULT (CURRENT_DATE)
);

CREATE TABLE Appointments(
Appointment_ID INT PRIMARY KEY AUTO_INCREMENT,
Patient_ID INT NOT NULL,
Doctor_ID INT NOT NULL,
Appointment_Date DATE NOT NULL,
Appointment_Time TIME NOT NULL,
Status ENUM ('Scheduled', 'Completed', 'Cancelled') DEFAULT ('Scheduled'),

FOREIGN KEY (Patient_ID)
REFERENCES Patients(Patient_ID),

FOREIGN KEY(Doctor_ID)
REFERENCES Doctors(Doctor_ID)
);

CREATE TABLE Medicines (
Medicine_ID INT AUTO_INCREMENT PRIMARY KEY,
Medicine_Name VARCHAR (40) NOT NULL,
Price DECIMAL (10,2) NOT NULL
);

CREATE TABLE Patient_Medication(
Patient_ID INT,
Medicine_ID INT,
Dosage VARCHAR (50),
Duration_days INT,

PRIMARY KEY (Patient_ID, Medicine_ID),

FOREIGN KEY (Patient_ID)
REFERENCES Patients( Patient_ID),

FOREIGN KEY (Medicine_ID)
REFERENCES Medicines(Medicine_ID)
);

CREATE TABLE Prescriptions(
Prescription_ID INT AUTO_INCREMENT PRIMARY KEY,
Patient_ID INT NOT NULL,
Doctor_ID INT NOT NULL,
Prescription_Date DATE DEFAULT (CURRENT_DATE),

FOREIGN KEY (Patient_ID)
REFERENCES Patients (Patient_ID),

FOREIGN KEY (Doctor_ID)
REFERENCES Doctors (Doctor_ID)
);

CREATE TABLE Billing(
Billing_ID INT PRIMARY KEY AUTO_INCREMENT,
Patient_ID INT NOT NULL,
Appointment_ID INT NOT NULL,
Amount DECIMAL (10,2) CHECK (Amount>=0),
Payment_Method ENUM ('Cash', 'Card', 'Insurance', 'Mobile Money'),
Payment_Status ENUM ('Paid', 'Pending') DEFAULT ('Pending'),

FOREIGN KEY (Patient_ID)
REFERENCES Patients(Patient_ID),
FOREIGN KEY (Appointment_ID)
REFERENCES Appointments (Appointment_ID)
);
