-- =============================================
-- STEP 6: SQL OPERATIONS
-- Appointment System - All Required Queries
-- =============================================

USE AppointmentSystem;

-- =============================================
-- 1. SELECT QUERY (Retrieve data)
-- =============================================

-- Query 1a: Get all clients
SELECT * FROM Clients;

-- Query 1b: Get all active service providers
SELECT FullName, Specialization, Email, Phone 
FROM ServiceProviders 
WHERE IsActive = TRUE;

-- Query 1c: Get all scheduled appointments
SELECT AppointmentID, ClientID, ServiceID, AppointmentDate, AppointmentTime, Status
FROM Appointments 
WHERE Status = 'Scheduled';

-- =============================================
-- 2. INSERT QUERY (Add new record)
-- =============================================

-- Add a new client
INSERT INTO Clients (FirstName, LastName, Email, Phone, Address, DateRegistered)
VALUES ('Michael', 'Rivera', 'michael.rivera@email.com', '09123456799', '888 New St., Manila', CURDATE());

-- Add a new service provider
INSERT INTO ServiceProviders (FullName, Specialization, Email, Phone, IsActive)
VALUES ('Dr. Fe Del Mundo', 'Pediatrician', 'dr.delmundo@clinic.com', '09123456810', TRUE);

-- Add a new service
INSERT INTO Services (ServiceName, Description, DurationMinutes, Price, ProviderID)
VALUES ('Child Checkup', 'Regular pediatric checkup', 30, 600.00, 11);

-- Add a new appointment
INSERT INTO Appointments (ClientID, ServiceID, AppointmentDate, AppointmentTime, Status, Notes, CreatedAt)
VALUES (11, 14, '2024-04-01', '09:00:00', 'Scheduled', 'First visit for new client', NOW());

-- Add a new payment
INSERT INTO Payments (AppointmentID, AmountPaid, PaymentDate, PaymentMethod)
VALUES (15, 600.00, NOW(), 'Cash');

-- =============================================
-- 3. UPDATE QUERY (Modify existing records)
-- =============================================

-- Update 3a: Change a client's phone number
UPDATE Clients 
SET Phone = '09998887777' 
WHERE ClientID = 1;

-- Update 3b: Mark an appointment as completed
UPDATE Appointments 
SET Status = 'Completed' 
WHERE AppointmentID = 15;

-- Update 3c: Increase price of all dental services by 10%
UPDATE Services 
SET Price = Price * 1.10 
WHERE ServiceName LIKE '%Dental%';

-- Update 3d: Deactivate a service provider
UPDATE ServiceProviders 
SET IsActive = FALSE 
WHERE ProviderID = 5;

-- =============================================
-- 4. DELETE QUERY (Remove records)
-- =============================================

-- Delete 4a: Remove a cancelled appointment
DELETE FROM Appointments 
WHERE AppointmentID = 4 AND Status = 'Cancelled';

-- Delete 4b: Remove a specific payment
DELETE FROM Payments 
WHERE PaymentID = 4;

-- Delete 4c: Remove inactive service provider (if no appointments)
DELETE FROM ServiceProviders 
WHERE ProviderID = 5 AND IsActive = FALSE;

-- =============================================
-- 5. JOIN QUERY (Combine multiple tables)
-- =============================================

-- Query 5a: Show all appointments with client names and service details
SELECT 
    a.AppointmentID,
    CONCAT(c.FirstName, ' ', c.LastName) AS ClientName,
    s.ServiceName,
    a.AppointmentDate,
    a.AppointmentTime,
    a.Status
FROM Appointments a
JOIN Clients c ON a.ClientID = c.ClientID
JOIN Services s ON a.ServiceID = s.ServiceID
ORDER BY a.AppointmentDate DESC;

-- Query 5b: Show payments with appointment and client information
SELECT 
    p.PaymentID,
    CONCAT(c.FirstName, ' ', c.LastName) AS ClientName,
    s.ServiceName,
    p.AmountPaid,
    p.PaymentMethod,
    p.PaymentDate
FROM Payments p
JOIN Appointments a ON p.AppointmentID = a.AppointmentID
JOIN Clients c ON a.ClientID = c.ClientID
JOIN Services s ON a.ServiceID = s.ServiceID;

-- Query 5c: Show all services with their provider names
SELECT 
    sv.ServiceName,
    sv.Description,
    sv.Price,
    sp.FullName AS ProviderName,
    sp.Specialization
FROM Services sv
JOIN ServiceProviders sp ON sv.ProviderID = sp.ProviderID;

-- =============================================
-- 6. SUBQUERY QUERY (Nested query)
-- =============================================

-- Query 6a: Find clients who have spent more than average
SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS ClientName,
    SUM(p.AmountPaid) AS TotalSpent
FROM Clients c
JOIN Appointments a ON c.ClientID = a.ClientID
JOIN Payments p ON a.AppointmentID = p.AppointmentID
GROUP BY c.ClientID
HAVING TotalSpent > (SELECT AVG(AmountPaid) FROM Payments);

-- Query 6b: Find services that cost more than the average service price
SELECT ServiceName, Price
FROM Services
WHERE Price > (SELECT AVG(Price) FROM Services);

-- Query 6c: Find clients who have never cancelled an appointment
SELECT DISTINCT CONCAT(c.FirstName, ' ', c.LastName) AS ClientName
FROM Clients c
WHERE c.ClientID NOT IN (
    SELECT DISTINCT ClientID 
    FROM Appointments 
    WHERE Status = 'Cancelled'
);

-- Query 6d: Show the most expensive service
SELECT ServiceName, Price
FROM Services
WHERE Price = (SELECT MAX(Price) FROM Services);

-- Query 6e: Show clients with more than 2 appointments
SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS ClientName,
    (SELECT COUNT(*) FROM Appointments a WHERE a.ClientID = c.ClientID) AS AppointmentCount
FROM Clients c
WHERE (SELECT COUNT(*) FROM Appointments a WHERE a.ClientID = c.ClientID) > 2;