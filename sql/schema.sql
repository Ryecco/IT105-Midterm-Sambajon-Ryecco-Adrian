-- =============================================
-- APPOINTMENT SYSTEM - COMPLETE SCHEMA
-- =============================================

CREATE DATABASE AppointmentSystem;
USE AppointmentSystem;

-- Table 1: Clients (people booking appointments)
CREATE TABLE Clients (
    ClientID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Address VARCHAR(200),
    DateRegistered DATE DEFAULT CURRENT_DATE
);

-- Table 2: ServiceProviders (doctors, therapists, consultants)
CREATE TABLE ServiceProviders (
    ProviderID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    IsActive BOOLEAN DEFAULT TRUE
);

-- Table 3: Services (types of appointments)
CREATE TABLE Services (
    ServiceID INT PRIMARY KEY AUTO_INCREMENT,
    ServiceName VARCHAR(100) NOT NULL,
    Description TEXT,
    DurationMinutes INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    ProviderID INT,
    FOREIGN KEY (ProviderID) REFERENCES ServiceProviders(ProviderID)
);

-- Table 4: Appointments (bookings)
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    ClientID INT NOT NULL,
    ServiceID INT NOT NULL,
    AppointmentDate DATE NOT NULL,
    AppointmentTime TIME NOT NULL,
    Status ENUM('Scheduled', 'Confirmed', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    Notes TEXT,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);

-- Table 5: Payments (optional but good for completeness)
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    AppointmentID INT NOT NULL,
    AmountPaid DECIMAL(10,2) NOT NULL,
    PaymentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    PaymentMethod ENUM('Cash', 'Card', 'Online') NOT NULL,
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);