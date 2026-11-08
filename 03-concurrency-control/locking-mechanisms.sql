-- =====================================================
-- MIVA MIT PORTFOLIO 3
-- Experiment 6: Row-Level Locking
-- Case Study: Student Management System
-- PostgreSQL 18
-- =====================================================

-- TEST TABLE SETUP

DROP TABLE IF EXISTS portfolio3_locking_test;

CREATE TABLE portfolio3_locking_test (
    course_code VARCHAR(20) PRIMARY KEY,
    course_title VARCHAR(100) NOT NULL,
    available_slots INTEGER NOT NULL
);

INSERT INTO portfolio3_locking_test
(course_code, course_title, available_slots)
VALUES
('CSC401', 'Advanced Database Systems', 10);


-- SESSION 1: ACQUIRE ROW LOCK

BEGIN;

SELECT *
FROM portfolio3_locking_test
WHERE course_code = 'CSC401'
FOR UPDATE;

-- Keep this transaction open while Session 2
-- attempts to update the same record.

COMMIT;


-- SESSION 2: UPDATE COURSE AVAILABILITY

BEGIN;

UPDATE portfolio3_locking_test
SET available_slots = available_slots - 1
WHERE course_code = 'CSC401';

COMMIT;


-- FINAL VERIFICATION

SELECT *
FROM portfolio3_locking_test
WHERE course_code = 'CSC401';

-- Expected available_slots: 9
