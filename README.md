# Portfolio 3 – Transactions and Concurrency

## 1. Project Overview

This project demonstrates the practical implementation of database transactions, transaction isolation, concurrency management and control mechanisms using PostgreSQL.

The project uses the **Student Management System** case study developed in Portfolio 1 (Database Design and Modelling) and extended in Portfolio 2 (Query Optimization).

It focuses on maintaining database consistency, ensuring transaction reliability, preventing concurrency-related problems and demonstrating how PostgreSQL manages simultaneous database operations.

## 2. Case Study

**Student Management System**

The database represents an academic institution where students register for courses, enrol in course offerings and receive examination results.

The system involves multiple related entities, including:

- Departments
- Students
- Lecturers
- Courses
- Semesters
- Course Offerings
- Enrollments
- Results

These entities provide a practical environment for testing transactions and concurrency control.

## 3. Project Objectives

The objectives of this project are to:

1. Demonstrate transaction execution using `BEGIN`, `COMMIT` and `ROLLBACK`.
2. Explain and implement transaction isolation levels in PostgreSQL.
3. Investigate concurrency problems arising from simultaneous database operations.
4. Demonstrate concurrency control using locking mechanisms.
5. Evaluate how transaction management protects database integrity and consistency.
6. Capture SQL execution outputs and screenshots as practical evidence.

## 4. Database Environment

| Component | Technology |
|---|---|
| Database Management System | PostgreSQL 18 |
| Database Interface | pgAdmin 4 |
| Query Language | SQL |
| Case Study | Student Management System |
| Version Control | Git and GitHub |
| Operating System | Windows 11 |

## 5. Project Structure

```text
transactions-and-concurrency/
│
├── README.md
│
├── 01-transaction-fundamentals/
│   ├── commit-transactions.sql
│   └── rollback-transactions.sql
│
├── 02-transaction-isolation/
│   ├── read-committed.sql
│   ├── repeatable-read.sql
│   └── serializable.sql
│
├── 03-concurrency-control/
│   ├── concurrency-problem.sql
│   └── locking-mechanisms.sql
│
├── 04-transaction-testing/
│   ├── session-one.sql
│   └── session-two.sql
│
├── 05-evidence/
│   └── screenshots/
│
└── 06-documentation/
    └── final-report.md
```

## 6. Practical Experiments

### Experiment 1: Transaction Fundamentals
- Starting a transaction.
- Committing successful database operations.
- Rolling back unsuccessful operations.
- Verifying database changes.

### Experiment 2: Transaction Isolation
- READ COMMITTED.
- REPEATABLE READ.
- SERIALIZABLE.
- Observing transaction visibility and consistency.

### Experiment 3: Concurrency Problems
- Simultaneous database transactions.
- Investigating conflicting updates.
- Demonstrating potential lost-update scenarios.

### Experiment 4: Concurrency Control
- Row-level locking.
- SELECT FOR UPDATE.
- Managing concurrent database access.
- Evaluating the effectiveness of locking mechanisms.

## 7. Expected Evidence

The project will provide the following practical evidence:

- Successful transaction execution and commit outputs.
- Rollback demonstrations showing reversed database changes.
- Transaction isolation test results.
- Concurrent session execution outputs.
- Demonstrations of concurrency problems and their solutions.
- Screenshots of PostgreSQL query execution and results.
- Final technical documentation.

## 8. Learning Outcomes

Upon completion, this project will demonstrate practical understanding of:

- ACID transaction properties.
- PostgreSQL transaction management.
- Database isolation levels.
- Concurrent database operations.
- Locking and concurrency control.
- Database consistency and integrity.

## 9. Academic Context

**Programme:** Master in Information Technology (MIT)  
**Institution:** MIVA Open University  
**Portfolio:** 3 – Transactions and Concurrency  
**Case Study:** Student Management System  
**Database Platform:** PostgreSQL 18

---

*This portfolio forms part of the MIVA MIT practical database systems academic portfolio series.*
