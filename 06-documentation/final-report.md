# MIVA MIT Academic Portfolio 3
## Transactions and Concurrency
### Case Study: Student Management System

**Database Platform:** PostgreSQL 18  
**Project Type:** Practical Database Administration and Management  
**Programme:** Master in Information Technology (MIT)  
**Specialisation:** Information Technology Management

---

## 1. Introduction

Database transactions and concurrency control are essential components of reliable database management systems. They ensure that database operations are executed accurately, consistently, and safely, particularly when multiple users access or modify shared data simultaneously.

This project demonstrates the practical application of transaction management, transaction isolation levels, and concurrency control mechanisms using PostgreSQL 18.

A Student Management System was adopted as the case study to simulate realistic university database operations, including student records, course enrolment, course availability, and concurrent administrative activities.

## 2. Project Objectives

The objectives of this project are to:

1. Understand and demonstrate transaction management in PostgreSQL.
2. Apply COMMIT and ROLLBACK operations.
3. Examine the behaviour of different transaction isolation levels.
4. Demonstrate how concurrent database operations affect data consistency.
5. Implement row-level locking to control simultaneous updates.
6. Investigate the lost update problem and demonstrate its prevention through atomic updates.
7. Develop practical skills in database transaction testing and concurrency management.

## 3. Tools and Technologies

The following tools and technologies were used:

| Component | Technology |
|---|---|
| Database Management System | PostgreSQL 18 |
| Database Administration Tool | pgAdmin 4 |
| Query Language | SQL |
| Version Control | Git and GitHub |
| Operating System | Windows 11 |
| Case Study | Student Management System |

## 4. Database Transaction Fundamentals

A database transaction is a logical unit of work consisting of one or more SQL operations. Transactions help maintain database reliability through the ACID properties.

### 4.1 ACID Properties

- **Atomicity:** A transaction is completed entirely or not executed at all.
- **Consistency:** A transaction moves the database from one valid state to another.
- **Isolation:** Concurrent transactions are controlled to prevent unacceptable interference.
- **Durability:** Committed changes are preserved against subsequent failures, subject to the database's durability configuration.

### 4.2 COMMIT Transaction

The COMMIT experiment demonstrated how PostgreSQL confirms and saves changes made within a transaction.

A test table was created, student records were inserted, and the transaction was committed.

**Observed result:** The inserted records remained available in the temporary table after COMMIT in the same database session.

### 4.3 ROLLBACK Transaction

The ROLLBACK experiment demonstrated how PostgreSQL reverses uncommitted transaction changes.

A test student record was inserted within a transaction, and ROLLBACK was used to reverse the insertion.

**Expected result:** The inserted record should no longer be present after ROLLBACK. The final verification query should return zero rows.

## 5. Transaction Isolation Levels

Transaction isolation levels determine how concurrent transactions interact and what changes they can observe.

### 5.1 READ COMMITTED

READ COMMITTED was tested using two separate database sessions.

Session 1 initially read a student's enrolment status as Pending. Session 2 updated the status to Approved and committed the change.

When Session 1 executed a new SELECT statement, it observed the updated Approved status.

**Observation:** Under READ COMMITTED, each statement sees data committed before that statement begins. A repeated query within the same transaction may therefore return a different result.

### 5.2 REPEATABLE READ

The REPEATABLE READ experiment used two separate database sessions.

Session 1 started a REPEATABLE READ transaction and read the student's status as Pending. Session 2 subsequently updated the status to Approved and committed the change.

Session 1 continued to see Pending within its transaction. After Session 1 committed and started a fresh transaction, it could observe Approved.

**Observation:** REPEATABLE READ provides a consistent snapshot for the transaction, preventing non-repeatable reads.

### 5.3 SERIALIZABLE

The SERIALIZABLE experiment simulated two university administrators attempting to register students while enforcing a maximum capacity of one student.

Both sessions initially observed zero registered students and attempted to insert a record within SERIALIZABLE transactions.

Session 1 committed successfully. Session 2 encountered a serialization failure with SQLSTATE 40001.

**Observation:** PostgreSQL detected a conflicting transaction dependency and cancelled one transaction to preserve serializable execution.

The failed transaction may be retried as indicated by PostgreSQL's error hint.

## 6. Concurrency Control

Concurrency control ensures that simultaneous database operations do not produce inconsistent or incorrect results.

### 6.1 Row-Level Locking

The row-level locking experiment used the SELECT ... FOR UPDATE statement to acquire a lock on a course record.

The course availability record was represented by course code CSC401.

Session 1 acquired a row-level lock, while Session 2 attempted to update the same record.

After the lock was released, the second session could proceed with its update.

**Observed final availability:** 9 slots, following one successful decrement from the initial value of 10.

### 6.2 Lost Update Problem

The lost update experiment simulated two administrators reading the same course availability value and independently attempting to update it.

Both sessions initially read an availability value of 10. Each then attempted to set the value to 9.

This scenario illustrates how an update based on an outdated value can overwrite another transaction's change.

### 6.3 Prevention Using Atomic Updates

To prevent lost updates, the project used an atomic SQL operation:

```sql
UPDATE portfolio3_lost_update_test
SET available_slots = available_slots - 1
WHERE course_code = 'CSC402';
```

Two concurrent sessions executed this operation.

**Observed result:** The final available slot count was 8, demonstrating that both decrements were applied successfully.

Atomic updates reduce the risk of stale-value overwrites by performing the calculation directly against the current database value.

## 7. Summary of Experiments

| No. | Experiment | Key Result |
|---|---|---|
| 1 | COMMIT | Transaction changes committed successfully |
| 2 | ROLLBACK | Uncommitted changes reversed |
| 3 | READ COMMITTED | New statement observed committed updates |
| 4 | REPEATABLE READ | Consistent snapshot maintained within transaction |
| 5 | SERIALIZABLE | Conflicting transaction cancelled with SQLSTATE 40001 |
| 6 | Row-Level Locking | Course availability reduced from 10 to 9 |
| 7 | Lost Update | Demonstrated stale-value overwrite scenario |
| 8 | Atomic Update | Two concurrent decrements produced a final value of 8 |

## 8. Practical Applications in a University Management System

The concepts demonstrated in this project have important applications in university information systems.

Examples include:

1. **Course Registration:** Preventing multiple students from taking the last available course slot simultaneously.
2. **Student Enrolment:** Maintaining accurate enrolment records when multiple administrators process registrations.
3. **Examination Results:** Ensuring that concurrent updates to student results do not produce inconsistent records.
4. **Fee Payment Processing:** Using transactions to ensure payment records and student account balances are updated consistently.
5. **Administrative Operations:** Applying appropriate transaction isolation and locking strategies to protect shared database records.

## 9. Challenges and Lessons Learned

During the practical implementation, the following technical issues and lessons were encountered:

- Temporary tables are session-specific and cannot be shared between independent database connections.
- Separate pgAdmin Query Tool tabs may share a backend connection; independent sessions must be established for genuine concurrency testing.
- Transaction execution order is important when demonstrating locking and isolation.
- A transaction waiting for a row lock must be allowed to continue after the blocking transaction commits.
- PostgreSQL may cancel one transaction under SERIALIZABLE isolation when concurrent operations cannot be safely serialized.
- Atomic SQL updates provide a practical approach to avoiding stale-value update problems.

These exercises improved practical understanding of PostgreSQL transaction management and concurrent database behaviour.

## 10. Conclusion

This project successfully explored important transaction management and concurrency control concepts using PostgreSQL 18 and a Student Management System case study.

The practical exercises demonstrated the use of COMMIT and ROLLBACK, the behaviour of READ COMMITTED, REPEATABLE READ, and SERIALIZABLE isolation levels, and the role of row-level locking in managing concurrent database operations.

The lost update experiment further highlighted the risks associated with concurrent modifications, while atomic updates demonstrated a practical way to preserve data accuracy.

The project reinforces the importance of transaction management in designing reliable, secure, and consistent database systems for university information management and other enterprise applications.

## 11. References

1. PostgreSQL Global Development Group. *PostgreSQL Documentation: Transactions*. https://www.postgresql.org/docs/current/tutorial-transactions.html
2. PostgreSQL Global Development Group. *PostgreSQL Documentation: Transaction Isolation*. https://www.postgresql.org/docs/current/transaction-iso.html
3. PostgreSQL Global Development Group. *PostgreSQL Documentation: Explicit Locking*. https://www.postgresql.org/docs/current/explicit-locking.html
4. PostgreSQL Global Development Group. *PostgreSQL Documentation: Concurrency Control*. https://www.postgresql.org/docs/current/mvcc.html

---

**Project Repository:** [Transactions and Concurrency – GitHub](https://github.com/JohnsonAkoh/transactions-and-concurrency)
