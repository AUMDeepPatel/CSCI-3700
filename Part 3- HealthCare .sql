DROP DATABASE IF EXISTS Healthcare;
CREATE DATABASE Healthcare;
USE Healthcare;

CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    dob DATE,
    gender VARCHAR(10),
    contact_number VARCHAR(15) NOT NULL,
    email VARCHAR(100),
    address VARCHAR(100),
    insurance_provider VARCHAR(100),
    emergency_contact VARCHAR(100) NOT NULL
);

CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    specialty VARCHAR(100) NOT NULL,
    contact_number VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL,
    hospital_department VARCHAR(100) NOT NULL
);

CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_identification INT,
    doctor_identification INT,
    appointment_date DATETIME,
    reason VARCHAR(200),
    CONSTRAINT appointments_fk_patients_id
        FOREIGN KEY (patient_identification)
        REFERENCES Patients(patient_id),
    CONSTRAINT appointments_fk_doctor
        FOREIGN KEY (doctor_identification)
        REFERENCES Doctors(doctor_id)
);

CREATE TABLE Medical_Records (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_identification INT,
    doctor_identification INT,
    diagnosis TEXT,
    treatment TEXT,
    prescription TEXT,
    record_date DATETIME,
    CONSTRAINT medical_records_fk_patients_id
        FOREIGN KEY (patient_identification)
        REFERENCES Patients(patient_id),
    CONSTRAINT medical_record_fk_doctor
        FOREIGN KEY (doctor_identification)
        REFERENCES Doctors(doctor_id)
);

CREATE TABLE Billing (
    bill_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_identification INT,
    amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    billing_date DATETIME,
    CONSTRAINT billing_fk_patients_id
        FOREIGN KEY (patient_identification)
        REFERENCES Patients(patient_id)
);

INSERT INTO Patients (first_name, last_name, dob, gender, contact_number, email, address, insurance_provider, emergency_contact)
VALUES
('Mary', 'Buckley', '2020-05-08', 'Female', '806-544-6440', 'laurahaynes@lifeguardinsurance.com', '2818 Stone Lane Suite 527 Port Hannah, FL 37735', 'LifeGuard', 'Mr. James Bowers'),
('Michael', 'White', '1945-08-19', 'Male', '428-859-7985', 'anthonylittle@lifeguardinsurance.com', '35803 Porter Camp Apt. 131 West Johnfurt, MI 50577', 'LifeGuard', 'Ryan Ellis'),
('Brian', 'Mcbride', '2018-07-27', 'Male', '758-419-6606', 'johnanderson@healthpluscare.com', '080 Ramos Stream Suite 430 North Leahside, MA 06196', 'HealthPlus', 'Alicia Miller'),
('Traci', 'Sparks', '1983-03-02', 'Female', '744-908-8938', 'uosborne@medicareassist.com', '63946 Sanford Burgs Apt. 100 Diazhaven, VI 75471', 'MediCare', 'Brandy Wang'),
('Rachel', 'Moore', '1981-06-11', 'Female', '586-702-2325', 'benjaminguerrero@medicareassist.com', '630 April Locks Lake Melaniemouth, NC 03939', 'MediCare', 'Micheal Acosta'),
('Dennis', 'Snyder', '1972-02-01', 'Male', '514-255-9974', 'ccruz@healthpluscare.com', 'USNS Jackson FPO AP 69307', 'HealthPlus', 'Jody Lang'),
('Rebecca', 'Kennedy', '1960-03-02', 'Female', '903-538-8600', 'evaughan@lifeguardinsurance.com', '52522 Campbell Valley Lake Richard, SC 25263', 'LifeGuard', 'Andrew Johnson'),
('Nancy', 'Baker', '1980-02-18', 'Female', '201-818-2356', 'yyoung@healthpluscare.com', '213 Sabrina Walks Suite 271 New Tristan, MO 96203', 'HealthPlus', 'Diana Hamilton'),
('Kimberly', 'Cruz', '1928-03-18', 'Female', '492-249-9541', 'ugarcia@lifeguardinsurance.com', '992 Ryan Hollow Suite 867 New Johnfort, TX 90950', 'LifeGuard', 'Nicholas Gray'),
('Bradley', 'Brandt', '1944-09-21', 'Male', '216-708-6730', 'kevinduke@lifeguardinsurance.com', '40552 Karen Hill Apt. 293 Lake Richardmouth, RI 92888', 'LifeGuard', 'Cynthia Morgan'),
('Zachary', 'Banks', '2014-02-10', 'Male', '324-587-2341', 'gporter@healthpluscare.com', '60845 Nathan Courts Richardsmouth, NY 36369', 'HealthPlus', 'Edward Jimenez'),
('Daniel', 'Russell', '1965-02-17', 'Male', '996-595-5304', 'martinezmichael@medicareassist.com', '1539 Mallory Landing Port Melinda, AR 53193', 'MediCare', 'Dana Marshall'),
('Andrea', 'Miller', '1999-12-19', 'Female', '778-351-6722', 'mmejia@medicareassist.com', 'PSC 8962, Box 9128 APO AE 95334', 'MediCare', 'Linda Grant'),
('Angela', 'Snow', '1937-07-19', 'Female', '937-220-4202', 'ffowler@healthpluscare.com', '80203 Jennifer Fields Bensontown, AL 05089', 'HealthPlus', 'Johnathan West'),
('Ashley', 'Garza', '1958-09-26', 'Female', '275-809-5437', 'morenokendra@medicareassist.com', '81898 Latoya Fork Apt. 283 Mitchellside, GA 73916', 'MediCare', 'Michele Brooks'),
('Robert', 'Cohen', '1974-12-04', 'Male', '877-823-2810', 'matthewhuynh@healthpluscare.com', '6608 Garcia Pines Keithberg, VI 46693', 'HealthPlus', 'Kelly Washington'),
('Kayla', 'Ryan', '1992-10-07', 'Female', '852-492-5671', 'julierios@medicareassist.com', '0026 Karl Road Grantfurt, VT 04221', 'MediCare', 'Melissa Wolf'),
('Glenn', 'Robinson', '1985-10-22', 'Male', '405-316-3926', 'kellie03@healthpluscare.com', '41289 Baker Skyway Apt. 347 South Danielleton, IL 02673', 'HealthPlus', 'Kayla Gibson'),
('Kimberly', 'Jackson', '1987-10-30', 'Female', '868-229-9977', 'arthurferrell@medicareassist.com', '91731 Martin Ville Whiteburgh, NC 02460', 'MediCare', 'Christopher White'),
('Veronica', 'Johnson', '1973-06-15', 'Female', '338-316-9914', 'amcdonald@medicareassist.com', '037 Christopher Viaduct Suite 364 Lake Ginastad, VA 16422', 'MediCare', 'Victoria Owen'),
('Shelly', 'Lopez', '1957-06-17', 'Female', '843-466-0268', 'schmittwilliam@medicareassist.com', '43461 Glenn Orchard Francobury, DC 44888', 'MediCare', 'Shelly Frey'),
('Tyler', 'Anderson', '1947-10-12', 'Male', '347-341-8591', 'sabrinahahn@healthpluscare.com', '29524 Bradley Prairie Suite 782 East Gregoryside, ND 46294', 'HealthPlus', 'Marisa Peters'),
('Alice', 'English', '1947-02-07', 'Female', '960-985-7120', 'kristilong@medicareassist.com', '2916 Holly Gateway Suite 346 North George, ND 89717', 'MediCare', 'Susan Garcia'),
('Kaitlyn', 'Reyes', '1941-05-29', 'Female', '492-532-1557', 'claytoncatherine@lifeguardinsurance.com', '4404 Myers Heights Mezaville, SC 66866', 'LifeGuard', 'Barbara Cunningham'),
('Robert', 'Murphy', '2004-08-15', 'Male', '284-778-8844', 'gregorycook@lifeguardinsurance.com', 'USNS Martin FPO AE 44065', 'LifeGuard', 'Ryan Williams'),
('Brian', 'Deleon', '2009-05-01', 'Male', '240-254-8615', 'katherine26@lifeguardinsurance.com', 'USNS Gardner FPO AP 73632', 'LifeGuard', 'Connie Nolan'),
('Cheryl', 'Miller', '1966-04-03', 'Female', '327-373-5552', 'cscott@medicareassist.com', '41391 Allison Islands North Beth, PR 44849', 'MediCare', 'Adam Johnson'),
('Henry', 'Evans', '1934-02-02', 'Male', '721-875-0695', 'blamb@medicareassist.com', '20776 Jennifer Burgs Gloriaville, VI 77985', 'MediCare', 'Gary Garza'),
('Denise', 'Manning', '2023-11-17', 'Female', '213-304-3349', 'matthewseric@medicareassist.com', '100 Amy Square North Jasonview, FM 94992', 'MediCare', 'Carlos Floyd'),
('Rita', 'Cummings', '2002-03-22', 'Female', '489-817-0399', 'charles64@healthpluscare.com', '36082 Pearson Valley Apt. 177 Williamsstad, WY 45547', 'HealthPlus', 'Jennifer Schmidt');


INSERT INTO Doctors (first_name, last_name, specialty, contact_number, email, hospital_department)
VALUES
('Shelley', 'Patterson', 'Pediatrics', '2269116768', 'john38@orthoclinic.com', 'Orthopedics'),
('Tiffany', 'Stout', 'Orthopedics', '260-458-2829', 'zmccormick@orthoclinic.com', 'Orthopedics'),
('Timothy', 'Johnson', 'Dermatology', '452-318-7555', 'tmorgan@skincareclinic.com', 'Orthopedics'),
('Heather', 'Dennis', 'Dermatology', '653-773-5693', 'xhernandez@pedsclinic.com', 'Pediatrics'),
('Regina', 'Conrad', 'Orthopedics', '4373416816', 'hmorgan@neurocenter.com', 'Neurology'),
('Devin', 'Henderson', 'Orthopedics', '470-684-2820', 'kelli07@neurocenter.com', 'Neurology'),
('Ryan', 'Oneal', 'Neurology', '764-473-1271', 'irivera@neurocenter.com', 'Neurology'),
('Brian', 'Swanson', 'Dermatology', '972-318-6549', 'pstewart@skincareclinic.com', 'Pediatrics'),
('Cynthia', 'Pratt', 'Cardiology', '981-401-3686', 'middletonvincent@heartcenter.com', 'Orthopedics'),
('Steven', 'Cardenas', 'Pediatrics', '325-961-1481', 'masonkatherine@pedsclinic.com', 'Pediatrics'),
('Angela', 'Phelps', 'Cardiology', '585-331-3747', 'jason64@heartcenter.com', 'Orthopedics'),
('Kristen', 'Norton', 'Orthopedics', '757-225-2195', 'robertwalker@orthoclinic.com', 'Pediatrics'),
('Justin', 'Richards', 'Pediatrics', '558-495-6326', 'samuel01@cardiacclinic.com', 'Cardiology'),
('Edward', 'Walker', 'Dermatology', '915-283-0152', 'helen13@skincareclinic.com', 'Dermatology'),
('Donald', 'Reynolds', 'Cardiology', '3242332854', 'michael15@neurocenter.com', 'Neurology'),
('Austin', 'Richards', 'Dermatology', '701-454-7453', 'falvarado@skincareclinic.com', 'Neurology'),
('Larry', 'Lopez', 'Cardiology', '4002766581', 'tracyflores@heartcenter.com', 'Neurology'),
('David', 'Garcia', 'Pediatrics', '213-420-6724', 'michaelmalone@pedsclinic.com', 'Dermatology'),
('Crystal', 'Guzman', 'Cardiology', '439-414-0753', 'tdickerson@neurocenter.com', 'Neurology'),
('Michele', 'Sweeney', 'Neurology', '340-477-9248', 'susan90@cardiacclinic.com', 'Cardiology'),
('Devin', 'Pena', 'Pediatrics', '405-464-4813', 'sanchezrebecca@pedsclinic.com', 'Cardiology'),
('Wendy', 'Mcclain', 'Cardiology', '788-539-4467', 'zjohnson@orthoclinic.com', 'Orthopedics'),
('Rachel', 'Miller', 'Cardiology', '280-775-9196', 'christopher73@heartcenter.com', 'Cardiology'),
('Patricia', 'Johnston', 'Neurology', '675-865-8964', 'steven90@skincareclinic.com', 'Dermatology'),
('Ryan', 'Woods', 'Cardiology', '600-683-4529', 'lindsey99@orthoclinic.com', 'Orthopedics'),
('Anna', 'Smith', 'Cardiology', '783-532-1532', 'nvelez@pedsclinic.com', 'Pediatrics'),
('Anthony', 'Gregory', 'Neurology', '888-559-0732', 'terrellamanda@skincareclinic.com', 'Dermatology'),
('David', 'Sanders', 'Orthopedics', '208-493-6021', 'amy43@orthoclinic.com', 'Orthopedics'),
('Sherry', 'Garcia', 'Cardiology', '376-765-0791', 'diane64@neurocenter.com', 'Neurology'),
('Allen', 'Moreno', 'Orthopedics', '621-977-2510', 'joseph79@cardiacclinic.com', 'Cardiology');

INSERT INTO Appointments (patient_identification, doctor_identification, appointment_date, reason)
VALUES
(4, 21, '2025-04-05 17:43:56', 'Follow-up'),
(18, 1, '2024-06-23 15:05:55', 'Routine Checkup'),
(9, 8, '2024-04-19 01:16:56', 'Routine Checkup'),
(22, 7, '2024-07-14 22:09:56', 'Follow-up'),
(3, 16, '2024-06-14 11:27:24', 'Headache'),
(13, 7, '2024-08-25 22:11:35', 'Headache'),
(13, 16, '2025-02-08 04:11:49', 'Routine Checkup'),
(8, 8, '2025-03-15 03:45:51', 'Routine Checkup'),
(22, 20, '2025-03-22 06:53:17', 'Skin Rash'),
(27, 15, '2025-03-18 04:12:49', 'Routine Checkup'),
(18, 24, '2025-03-29 21:00:51', 'Headache'),
(27, 6, '2024-07-17 15:52:39', 'Back Pain'),
(25, 3, '2024-07-16 23:39:14', 'Routine Checkup'),
(4, 22, '2024-09-21 19:40:41', 'Routine Checkup'),
(25, 20, '2025-01-23 02:10:54', 'Back Pain'),
(29, 13, '2024-07-02 23:31:06', 'Headache'),
(17, 23, '2025-03-18 07:30:47', 'Headache'),
(12, 3, '2025-03-11 00:22:52', 'Routine Checkup'),
(15, 22, '2024-05-24 10:06:30', 'Headache'),
(21, 10, '2024-06-11 04:36:09', 'Follow-up'),
(23, 5, '2024-10-29 17:59:32', 'Skin Rash'),
(22, 4, '2024-11-20 11:36:54', 'Follow-up'),
(21, 21, '2024-11-06 07:17:06', 'Headache'),
(10, 18, '2024-09-18 18:48:19', 'Routine Checkup'),
(9, 23, '2024-06-08 02:36:31', 'Headache'),
(15, 24, '2024-09-08 16:21:06', 'Follow-up'),
(13, 16, '2024-04-21 14:28:19', 'Follow-up'),
(21, 12, '2024-07-26 17:07:05', 'Skin Rash'),
(29, 11, '2024-07-13 03:34:38', 'Skin Rash'),
(25, 24, '2024-06-10 21:44:04', 'Follow-up');

INSERT INTO Medical_Records (record_id, patient_identification, doctor_identification, diagnosis, treatment, prescription, record_date)
VALUES
(1, 8, 7, 'Asthma', 'Therapy', 'Albuterol', '2023-08-09 10:18:45'),
(2, 28, 6, 'Diabetes', 'Therapy', 'Metformin', '2024-10-23 09:44:55'),
(3, 4, 7, 'Asthma', 'Surgery', 'Metformin', '2024-05-11 05:48:04'),
(4, 12, 17, 'Hypertension', 'Lifestyle Changes', 'Metformin', '2024-06-08 13:54:02'),
(5, 17, 21, 'Migraine', 'Medication', 'Ibuprofen', '2023-08-09 02:33:16'),
(6, 16, 30, 'Asthma', 'Medication', 'Metformin', '2023-09-13 22:02:38'),
(7, 12, 28, 'Hypertension', 'Lifestyle Changes', 'Metformin', '2023-11-14 15:35:20'),
(8, 1, 11, 'Hypertension', 'Lifestyle Changes', 'Ibuprofen', '2024-11-08 10:29:48'),
(9, 22, 18, 'Diabetes', 'Lifestyle Changes', 'Ibuprofen', '2024-11-15 23:16:44'),
(10, 5, 25, 'Migraine', 'Lifestyle Changes', 'Metformin', '2023-10-27 01:45:46'),
(11, 2, 7, 'Asthma', 'Therapy', 'Ibuprofen', '2023-10-21 18:40:27'),
(12, 10, 28, 'Hypertension', 'Lifestyle Changes', 'Albuterol', '2024-04-10 00:25:30'),
(13, 8, 16, 'Diabetes', 'Therapy', 'Metformin', '2025-02-28 20:27:29'),
(14, 27, 29, 'Allergy', 'Lifestyle Changes', 'Albuterol', '2024-12-10 14:17:49'),
(15, 3, 22, 'Migraine', 'Lifestyle Changes', 'Ibuprofen', '2024-08-14 11:12:05'),
(16, 16, 29, 'Migraine', 'Lifestyle Changes', 'Lisinopril', '2025-01-30 15:43:45'),
(17, 12, 14, 'Migraine', 'Lifestyle Changes', 'Cetirizine', '2024-04-02 21:45:43'),
(18, 15, 10, 'Migraine', 'Surgery', 'Metformin', '2024-09-30 20:07:04'),
(19, 28, 21, 'Hypertension', 'Therapy', 'Ibuprofen', '2023-12-18 18:55:11'),
(20, 20, 20, 'Diabetes', 'Therapy', 'Lisinopril', '2024-11-29 15:58:13'),
(21, 14, 17, 'Migraine', 'Lifestyle Changes', 'Cetirizine', '2024-08-11 01:50:10'),
(22, 8, 15, 'Migraine', 'Surgery', 'Metformin', '2023-05-23 15:25:16'),
(23, 15, 12, 'Allergy', 'Therapy', 'Lisinopril', '2024-11-24 05:55:10'),
(24, 8, 18, 'Migraine', 'Surgery', 'Metformin', '2024-03-17 22:04:09'),
(25, 29, 2, 'Hypertension', 'Surgery', 'Albuterol', '2023-08-11 10:29:39'),
(26, 24, 30, 'Hypertension', 'Surgery', 'Ibuprofen', '2024-06-26 05:03:24'),
(27, 23, 6, 'Diabetes', 'Lifestyle Changes', 'Metformin', '2024-07-20 16:48:33'),
(28, 27, 14, 'Allergy', 'Surgery', 'Ibuprofen', '2023-06-12 04:43:27'),
(29, 12, 16, 'Diabetes', 'Medication', 'Metformin', '2023-05-10 23:06:25'),
(30, 25, 14, 'Migraine', 'Lifestyle Changes', 'Cetirizine', '2023-04-21 02:57:25');

INSERT INTO Billing (patient_identification, amount, payment_status, billing_date)
VALUES
(8, 459.69, 'Unpaid', '2025-03-12 23:34:00'),
(20, 350.39, 'Paid', '2024-04-29 18:07:00'),
(20, 61.09, 'Paid', '2024-07-09 13:55:00'),
(2, 288.51, 'Unpaid', '2024-05-18 18:17:00'),
(17, 251.60, 'Paid', '2024-09-24 19:57:00'),
(20, 85.52, 'Paid', '2024-08-30 10:29:00'),
(5, 69.34, 'Paid', '2024-10-31 23:15:00'),
(19, 163.16, 'Unpaid', '2024-12-11 11:18:00'),
(3, 264.64, 'Paid', '2024-12-08 18:22:00'),
(12, 473.52, 'Unpaid', '2025-03-16 05:19:00'),
(15, 155.76, 'Unpaid', '2024-07-09 02:44:00'),
(5, 165.84, 'Unpaid', '2024-10-09 19:02:00'),
(3, 272.46, 'Unpaid', '2025-03-31 15:23:00'),
(15, 188.28, 'Unpaid', '2025-02-14 03:21:00'),
(30, 462.77, 'Paid', '2024-09-16 02:50:00'),
(16, 312.55, 'Unpaid', '2025-03-02 10:07:00'),
(8, 218.31, 'Paid', '2025-01-23 23:54:00'),
(14, 387.85, 'Paid', '2025-02-01 23:25:00'),
(18, 274.27, 'Paid', '2024-04-20 09:20:00'),
(11, 338.87, 'Paid', '2024-05-23 14:36:00'),
(11, 120.79, 'Paid', '2024-08-08 20:29:00'),
(27, 59.07, 'Unpaid', '2024-12-27 23:34:00'),
(28, 374.14, 'Unpaid', '2024-04-28 16:59:00'),
(15, 91.78, 'Paid', '2024-05-20 11:31:00'),
(5, 440.26, 'Unpaid', '2024-05-10 06:56:00'),
(16, 304.54, 'Paid', '2025-02-14 03:32:00'),
(12, 178.28, 'Paid', '2024-04-28 23:57:00'),
(26, 383.84, 'Paid', '2024-06-08 14:41:00'),
(12, 327.84, 'Paid', '2025-01-19 14:22:00'),
(2, 291.63, 'Unpaid', '2024-11-15 15:19:00');