-- =============================================
-- STEP 5: INSERT DATA
-- Appointment System - Sample Records
-- Based on EXACT schema structure
-- =============================================

USE AppointmentSystem;

-- =============================================
-- TABLE 1: CLIENTS (10 records)
-- Columns: FirstName, LastName, Email, Phone, Address, DateRegistered
-- =============================================
INSERT INTO Clients (FirstName, LastName, Email, Phone, Address, DateRegistered) VALUES
('John', 'Dela Cruz', 'john.delacruz@email.com', '09123456789', '123 Mabini St., Manila', '2024-01-01'),
('Maria', 'Santos', 'maria.santos@email.com', '09123456790', '456 Rizal Ave., Quezon City', '2024-01-02'),
('Carlos', 'Reyes', 'carlos.reyes@email.com', '09123456791', '789 Poblacion, Makati', '2024-01-03'),
('Anna', 'Garcia', 'anna.garcia@email.com', '09123456792', '321 Bonifacio St., Taguig', '2024-01-05'),
('Mark', 'Fernandez', 'mark.fernandez@email.com', '09123456793', '555 Luna St., Pasig', '2024-01-07'),
('Lisa', 'Mendoza', 'lisa.mendoza@email.com', '09123456794', '777 Jacinto St., Mandaluyong', '2024-01-10'),
('Paul', 'Villanueva', 'paul.villanueva@email.com', '09123456795', '999 Silang St., Paranaque', '2024-01-12'),
('Joy', 'Ramirez', 'joy.ramirez@email.com', '09123456796', '222 Zamora St., Las Pinas', '2024-01-15'),
('Ben', 'Torres', 'ben.torres@email.com', '09123456797', '444 Mabuhay St., Caloocan', '2024-01-18'),
('Rose', 'Aguilar', 'rose.aguilar@email.com', '09123456798', '666 Kalayaan St., Malabon', '2024-01-20');

-- =============================================
-- TABLE 2: SERVICE PROVIDERS (10 records)
-- Columns: FullName, Specialization, Email, Phone, IsActive
-- =============================================
INSERT INTO ServiceProviders (FullName, Specialization, Email, Phone, IsActive) VALUES
('Dr. Maria Reyes', 'Dentist', 'dr.reyes@clinic.com', '09123456800', TRUE),
('Dr. Juan Cruz', 'Dermatologist', 'dr.cruz@clinic.com', '09123456801', TRUE),
('Ms. Ana Lopez', 'Massage Therapist', 'ana.lopez@spa.com', '09123456802', TRUE),
('Dr. Pedro Santos', 'Optometrist', 'dr.santos@clinic.com', '09123456803', TRUE),
('Ms. Clara Dimagiba', 'Psychologist', 'clara@therapy.com', '09123456804', TRUE),
('Dr. Jose Rizal', 'Cardiologist', 'dr.rizal@hospital.com', '09123456805', TRUE),
('Ms. Bella Flores', 'Nutritionist', 'bella@nutrition.com', '09123456806', TRUE),
('Dr. Andres Bonifacio', 'Orthopedic', 'dr.bonifacio@clinic.com', '09123456807', TRUE),
('Ms. Corazon Aquino', 'Yoga Instructor', 'corazon@yoga.com', '09123456808', TRUE),
('Dr. Emilio Aguinaldo', 'Pediatrician', 'dr.aguinaldo@clinic.com', '09123456809', TRUE);

-- =============================================
-- TABLE 3: SERVICES (13 records)
-- Columns: ServiceName, Description, DurationMinutes, Price, ProviderID
-- =============================================
INSERT INTO Services (ServiceName, Description, DurationMinutes, Price, ProviderID) VALUES
('Dental Cleaning', 'Regular teeth cleaning and polishing', 30, 500.00, 1),
('Root Canal', 'Tooth restoration procedure', 90, 3000.00, 1),
('Facial Treatment', 'Deep cleansing facial with extraction', 45, 600.00, 2),
('Acne Treatment', 'Professional acne removal therapy', 60, 1200.00, 2),
('Full Body Massage', 'Relaxing full body Swedish massage', 60, 800.00, 3),
('Eye Exam', 'Comprehensive eye examination', 30, 400.00, 4),
('Therapy Session', 'One-on-one counseling session', 60, 1500.00, 5),
('ECG Test', 'Heart electrical activity test', 20, 800.00, 6),
('Nutrition Consultation', 'Diet and meal planning consultation', 45, 700.00, 7),
('Physical Therapy', 'Rehabilitation session for injuries', 60, 1200.00, 8),
('Yoga Class', 'Group yoga session for beginners', 60, 400.00, 9),
('Vaccination', 'Childhood immunization vaccines', 20, 500.00, 10),
('General Checkup', 'Routine physical examination', 30, 800.00, 10);

-- =============================================
-- TABLE 4: APPOINTMENTS (14 records)
-- Columns: ClientID, ServiceID, AppointmentDate, AppointmentTime, Status, Notes, CreatedAt
-- =============================================
INSERT INTO Appointments (ClientID, ServiceID, AppointmentDate, AppointmentTime, Status, Notes, CreatedAt) VALUES
(1, 1, '2024-01-15', '10:00:00', 'Completed', 'First dental visit, went well', NOW()),
(2, 3, '2024-01-16', '11:00:00', 'Completed', 'Acne treatment follow-up needed', NOW()),
(3, 5, '2024-01-20', '14:00:00', 'Completed', 'Stress relief massage - requested extra pressure', NOW()),
(4, 2, '2024-01-25', '09:00:00', 'Cancelled', 'Rescheduled by client due to emergency', NOW()),
(5, 6, '2024-02-01', '13:00:00', 'Completed', 'Blurry vision complaint - prescribed glasses', NOW()),
(6, 7, '2024-02-05', '15:00:00', 'Completed', 'Anxiety concerns - scheduled follow-up', NOW()),
(7, 8, '2024-02-10', '10:30:00', 'Completed', 'Chest pain history - ECG normal', NOW()),
(8, 9, '2024-02-12', '11:00:00', 'Completed', 'Weight loss goals - created meal plan', NOW()),
(9, 10, '2024-02-15', '14:00:00', 'Completed', 'Knee injury - prescribed exercises', NOW()),
(10, 11, '2024-02-18', '09:00:00', 'Completed', 'Beginner yoga class - enjoyed it', NOW()),
(1, 12, '2024-02-20', '13:30:00', 'Scheduled', 'Baby checkup for 6-month old', NOW()),
(2, 13, '2024-02-22', '15:00:00', 'Scheduled', 'Annual physical exam requested', NOW()),
(3, 4, '2024-03-01', '10:00:00', 'Scheduled', 'Acne treatment follow-up', NOW()),
(4, 1, '2024-03-05', '14:00:00', 'Confirmed', 'Rescheduled dental cleaning', NOW());

-- =============================================
-- TABLE 5: PAYMENTS (14 records)
-- Columns: AppointmentID, AmountPaid, PaymentDate, PaymentMethod
-- Note: PaymentStatus does NOT exist in your schema! Only PaymentMethod
-- =============================================
INSERT INTO Payments (AppointmentID, AmountPaid, PaymentDate, PaymentMethod) VALUES
(1, 500.00, NOW(), 'Cash'),
(2, 600.00, NOW(), 'Card'),
(3, 800.00, NOW(), 'Cash'),
(4, 3000.00, NOW(), 'Card'),
(5, 400.00, NOW(), 'Cash'),
(6, 1500.00, NOW(), 'Online'),
(7, 800.00, NOW(), 'Card'),
(8, 700.00, NOW(), 'Cash'),
(9, 1200.00, NOW(), 'Card'),
(10, 400.00, NOW(), 'Cash'),
(11, 500.00, NOW(), 'Online'),
(12, 800.00, NOW(), 'Card'),
(13, 1200.00, NOW(), 'Cash'),
(14, 500.00, NOW(), 'Card');

-- =============================================
-- VERIFICATION QUERIES (Run these to check)
-- =============================================
-- SELECT COUNT(*) FROM Clients;        -- Should be 10
-- SELECT COUNT(*) FROM ServiceProviders; -- Should be 10
-- SELECT COUNT(*) FROM Services;        -- Should be 13
-- SELECT COUNT(*) FROM Appointments;    -- Should be 14
-- SELECT COUNT(*) FROM Payments;        -- Should be 14