# IT105-Midterm-Sambajon-Ryecco-Adrian
# Appointment System Database - IT105 Midterm Project

## System Description
This is a database management system for a **clinic appointment system**. 
It allows clinics to manage clients, services, appointments, payments, 
and service providers. The system helps schedule appointments, track 
payments, and generate reports.

## Database Tables

| Table | Description | Columns |
|-------|-------------|---------|
| **clients** | Stores client information | ClientID, FirstName, LastName, Email, Phone, Address, DateRegistered |
| **services** | Available services offered | ServiceID, ServiceName, Description, DurationMinutes, Price, ProviderID |
| **serviceproviders** | Staff who provide services | ProviderID, FullName, Specialization, Email, Phone, IsActive |
| **appointments** | Scheduled appointments | AppointmentID, ClientID, ServiceID, AppointmentDate, AppointmentTime, Status, Notes |
| **payments** | Payment transactions | PaymentID, AppointmentID, AmountPaid, PaymentDate, PaymentMethod |

## Features Implemented

### SQL Operations
- ✅ **SELECT** - Retrieve appointment records
- ✅ **INSERT** - Add new clients and appointments
- ✅ **UPDATE** - Modify appointment status
- ✅ **DELETE** - Remove cancelled appointments
- ✅ **JOIN** - Combine multiple tables (clients + appointments + services)
- ✅ **SUBQUERY** - Find clients with multiple appointments

### Database Design
- ✅ Normalization (UNF → 1NF → 2NF → 3NF)
- ✅ Indexing for performance optimization
- ✅ Foreign key constraints for data integrity

## Reflection

### What I Learned

1. **Database Design**
   - How to identify entities and relationships
   - Importance of primary and foreign keys
   - How to prevent data redundancy through normalization

2. **SQL Skills**
   - Writing complex JOIN queries across 5 tables
   - Using subqueries to filter data
   - Creating indexes to speed up searches

3. **Indexing Performance**
   - Indexes make SELECT queries 2-3x faster
   - Full table scans are slow for large datasets
   - B-Tree structure allows O(log n) search time

4. **Version Control with Git**
   - How to commit and push changes to GitHub
   - Importance of descriptive commit messages
   - Keeping repository organized

### Challenges Faced
- Understanding the difference between 2NF and 3NF
- Writing correct JOIN syntax for multiple tables
- Measuring query performance with profiling

### How I Overcame Them
- Practiced normalization with sample data
- Used phpMyAdmin to test queries incrementally
- Researched MySQL profiling commands

### Future Improvements
- Add user authentication for different roles (admin, staff, client)
- Create more complex reports with aggregate functions
- Implement triggers for automatic status updates