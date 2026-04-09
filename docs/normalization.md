# Normalization of Appointment System

## Overview
This document shows the normalization process for my Appointment System from UNF (Unnormalized Form) to 3NF (Third Normal Form).

---

## UNF (Unnormalized Form)

**Problem:** One record contains multiple appointments with repeating client data. This makes it difficult to search, update, and maintain data integrity.

**Example Structure:**


**Problems in UNF:**
- Multiple appointments stored in one record
- Cannot easily query individual appointments
- Client information is repeated for each appointment
- Wasted storage space
- Difficult to update client information

---

## 1NF (First Normal Form)

**Solution:** Remove repeating groups - each appointment becomes its own row.

**Rule Applied:** Each column must have a single value (no lists or multiple values)

**1NF Table Structure:**

| ClientName | Phone | Email | AppointmentDate | Time | Service | Price |
|------------|-------|-------|----------------|------|---------|-------|
| John Dela Cruz | 09123456789 | john@email.com | 2024-01-15 | 10:00 | Dental | 500 |
| John Dela Cruz | 09123456789 | john@email.com | 2024-01-20 | 14:00 | Massage | 800 |
| John Dela Cruz | 09123456789 | john@email.com | 2024-02-01 | 09:00 | Dental | 500 |
| Maria Santos | 09123456790 | maria@email.com | 2024-01-16 | 11:00 | Facial | 600 |
| Maria Santos | 09123456790 | maria@email.com | 2024-01-25 | 15:00 | Massage | 800 |

**What changed:**
- Each row has ONE appointment value
- No repeating groups
- Can now query individual appointments

**Remaining Problems:**
- Client data repeated for every appointment
- If John changes phone number, need to update 3 rows
- Redundant data wastes space

---

## 2NF (Second Normal Form)

**Solution:** Remove partial dependencies - separate client data into its own table.

**Rule Applied:** All columns must depend on the ENTIRE primary key

**2NF Table Structure:**

**Table 1: Clients**
| ClientID | ClientName | Phone | Email |
|----------|------------|-------|-------|
| 1 | John Dela Cruz | 09123456789 | john@email.com |
| 2 | Maria Santos | 09123456790 | maria@email.com |

**Table 2: Appointments**
| AppointmentID | ClientID | AppointmentDate | Time | Service | Price |
|---------------|----------|----------------|------|---------|-------|
| 1 | 1 | 2024-01-15 | 10:00 | Dental | 500 |
| 2 | 1 | 2024-01-20 | 14:00 | Massage | 800 |
| 3 | 1 | 2024-02-01 | 09:00 | Dental | 500 |
| 4 | 2 | 2024-01-16 | 11:00 | Facial | 600 |
| 5 | 2 | 2024-01-25 | 15:00 | Massage | 800 |

**What changed:**
- Client information stored ONCE in Clients table
- Appointments table references ClientID (foreign key)
- Update client phone number once, not multiple times

**Remaining Problems:**
- Service information (Dental, Massage, Facial) still repeated
- Price depends on Service, not on Appointment
- If Dental price changes from 500 to 550, need to update multiple rows

---

## 3NF (Third Normal Form)

**Solution:** Remove transitive dependencies - separate service data into its own table.

**Rule Applied:** Remove columns that depend on other non-key columns

**3NF Final Table Structure:**

**Table 1: Clients**
| ClientID | ClientName | Phone | Email |
|----------|------------|-------|-------|
| 1 | John Dela Cruz | 09123456789 | john@email.com |
| 2 | Maria Santos | 09123456790 | maria@email.com |

**Table 2: Services**
| ServiceID | ServiceName | Duration | Price |
|-----------|-------------|----------|-------|
| 1 | Dental | 30 min | 500 |
| 2 | Massage | 60 min | 800 |
| 3 | Facial | 45 min | 600 |

**Table 3: Appointments (Final)**
| AppointmentID | ClientID | ServiceID | AppointmentDate | Time | Status |
|---------------|----------|-----------|----------------|------|---------|
| 1 | 1 | 1 | 2024-01-15 | 10:00 | Completed |
| 2 | 1 | 2 | 2024-01-20 | 14:00 | Completed |
| 3 | 1 | 1 | 2024-02-01 | 09:00 | Scheduled |
| 4 | 2 | 3 | 2024-01-16 | 11:00 | Completed |
| 5 | 2 | 2 | 2024-01-25 | 15:00 | Cancelled |

**What changed:**
- Service details stored ONCE in Services table
- Appointments table references ServiceID (foreign key)
- Price changes require only 1 update
- Easy to add new services

---

## Benefits of Normalization

| Benefit | Explanation |
|---------|-------------|
| **No Data Redundancy** | Client and service info stored once, not repeated |
| **Easy Updates** | Change phone number or price in ONE place |
| **Data Integrity** | Cannot have appointment for non-existent client |
| **Scalability** | Easy to add new clients, services, or appointments |
| **Storage Efficiency** | Less disk space used |
| **Query Performance** | Faster searches and joins |

---

## Summary of Transformation
