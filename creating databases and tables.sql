CREATE DATABASE Medicals;
Use Medicals;
CREATE TABLE Patients (
Patient_ID INT PRIMARY KEY,
Patient_name VARCHAR(100),
Age INT,
Gender VARCHAR(10),
Blood_type VARCHAR(5),
Phone VARCHAR(20),
Address VARCHAR(255)
);

CREATE TABLE Medical_Lab_Science (
Lab_test_ID INT PRIMARY KEY,
Patient_ID INT,
Test_name VARCHAR(100),
Result VARCHAR(50),
Test_Date DATE,
Lab_Technician VARCHAR(100),
Comments TEXT,
FOREIGN KEY(Patient_ID) REFERENCES Patients(Patient_ID) ON DELETE CASCADE
);

CREATE TABLE Physiotherapy (
Therapy_session_ID INT PRIMARY KEY,
Patient_ID INT,
Therapist_name VARCHAR(100),
Session_type VARCHAR(50),
Session_date DATE,
Duration INT,
Outcome TEXT,
FOREIGN KEY(Patient_ID) REFERENCES Patients(Patient_ID) ON DELETE CASCADE
);

CREATE TABLE Pharmacology (
Drug_ID INT PRIMARY KEY,
Patient_ID INT,
Drug_name VARCHAR(50),
Dosage VARCHAR(20),
Prescription_date DATE,
Prescription_doctor VARCHAR(100),
Side_effects TEXT,
FOREIGN KEY(Patient_ID) REFERENCES Patients(Patient_ID) ON DELETE CASCADE
);

CREATE TABLE Appointment (
Appointment_ID INT PRIMARY KEY,
Patient_ID INT NOT NULL,
Doctor_name VARCHAR(100) NOT NULL,
Department VARCHAR(50) NOT NULL,
Appointment_date DATE NOT NULL,
Appointment_status VARCHAR(50) NOT NULL,
Notes TEXT NOT NULL,
FOREIGN KEY(Patient_ID) REFERENCES Patients(Patient_ID) ON DELETE CASCADE
);

INSERT INTO Patients (Patient_ID, Patient_name, Age, Gender, Blood_type, Phone, Address)
VALUES
(5001, 'John Doe', 32, 'Male', 'O+', '123-456-7890', '10 Main St, NY'),
(5002, 'Alice Lee', 28, 'Female', 'A-', '987-654-3210', '45 Oak St, CA'),
(5003, 'Mark Kim', 40, 'Male', 'B+', '456-789-0123', '67 Pine St, TX'),  
(5004, 'Emma Davis', 36, 'Female', 'AB-', '234-567-8901', '89 Maple St, FL'),  
(5005, 'Jake Smith', 50, 'Male', 'O-', '345-678-9012', '23 Birch St, WA');  

INSERT INTO Medical_Lab_Science (Lab_test_ID, Patient_ID, Test_name, Result, Test_date, Lab_technician, Comments)
VALUES
(101, 5001, 'Blood Test', 'Normal', '2024-02-15', 'Dr. Wale', 'No issues'),
(102, 5002, 'Urine test', 'Abnormal', '2024-02-16', 'Dr. Bayo', 'Needs follow-up'),
(103, 5003, 'MRI Scan', 'Normal', '2024-02-20', 'Dr. Bisi', 'No abnormalities'),
(104, 5004, 'X-ray', 'Fracture', '2024-02-22', 'Dr. Gary', 'Possible surgery'),
(105, 5005, 'ECG', 'Normal', '2024-02-25', 'Dr. Ogochukwu', 'Stable heart');

INSERT INTO Physiotherapy (Therapy_session_ID, Patient_ID, Therapist_name, Session_type, Session_date, Duration, Outcome)
VALUES
(301, 5001, 'Dr.James', 'Massage', '2024-02-22', 45, 'Improved mobility'),
(302, 5002, 'Dr. Maria', 'Exercise', '2024-02-25', 60, 'Reduced pain'),
(303, 5003, 'Dr. Luke', 'Hydrotherapy', '2024-02-28', 40, 'No improvement'),
(304, 5004, 'Dr. Smith', 'Acupunture', '2024-03-01', 50, 'Moderate relief'),
(305, 5005, 'Dr. Johnson', 'Stretching', '2024-03-05', 30, 'Significant relief');

INSERT INTO Pharmacology (Drug_ID, Patient_ID, Drug_name, Dosage, Prescription_date, Prescription_doctor, Side_effects)
VALUES
(401, 5001, 'Ibuprofen', '200mg', '2024-02-18', 'Dr. Adamu', 'None reported'),
(402, 5002, 'Paracetamol', '500mg', '2024-02-20', 'Dr. Baker', 'Mild nausea'),
(403, 5003, 'Amoxicillin', '250mg', '2024-02-22', 'Dr. Carter', 'Dizziness'),
(404, 5004, 'Metformin', '850mg', '2024-02-24', 'Dr. Davis', 'No side effects'),
(405, 5005, 'Aspirin', '100mg', '2024-02-26', 'Dr. Evans', 'Stomach irritation');

INSERT INTO Appointment (Appointment_ID, Patient_ID, Doctor_name, Department, Appointment_date, Appointment_status, Notes)
VALUES
(601, 5001, 'Dr. Phil', 'General Check-up', '2024-02-10', 'Completed', 'Routine check'),
(602, 5002, 'Dr. Luke', 'Physiotherapy', '2024-02-15', 'Pending', 'First session'),
(603, 5003, 'Dr. Chase', 'Surgery', '2024-02-20', 'Completed', 'Post-surgery'),
(604, 5004, 'Dr. David', 'Cardiology', '2024-02-25', 'Cancelled', 'Rescheduled'),
(605, 5005, 'Dr. Finn', 'Neurology', '2024-03-01', 'Completed', 'Follow-up');
select * from patients;
select * from medical_lab_science;
select * from physiotherapy;
select * from pharmacology;
SELECT * FROM Appointment;
show tables;
use medicals;
select session_type from physiotherapy;
select drug_name, dosage from pharmacology
order by dosage desc;
select prescription_doctor, drug_name, dosage from pharmacology
order by drug_name asc;
select Doctor_name, Department, Appointment_status from Appointment
where Notes = 'Rescheduled';
select patient_name, gender, age from Patients
where gender = 'Male' and Age > 35;
select patient_name, gender, age from Patients
where not gender = 'Male' and (gender = 'Female' or Age < 40);
