-- =====================================================
-- MIVA MIT PORTFOLIO 3
-- Experiment 8: Lost Update and Prevention
-- Case Study: Student Management System
-- PostgreSQL 18
-- =====================================================

-- TEST TABLE SETUP

DROP TABLE IF EXISTS portfolio3_lost_update_test;

CREATE TABLE portfolio3_lost_update_test (
    course_code VARCHAR(20) PRIMARY KEY,
    available_slots INTEGER NOT NULL
);

INSERT INTO portfolio3_lost_update_test
(course_code, available_slots)
VALUES ('CSC402', 10);


-- PART A: LOST UPDATE SIMULATION
-- Two administrators read 10.
-- Both independently set the value to 9.
-- Demonstrate using two separate sessions.


-- SESSION 1:
BEGIN;

SELECT available_slots
FROM portfolio3_lost_update_test
WHERE course_code = 'CSC402';

UPDATE portfolio3_lost_update_test
SET available_slots = 9
WHERE course_code = 'CSC402';

COMMIT;


-- SESSION 2:
BEGIN;

SELECT available_slots
FROM portfolio3_lost_update_test
WHERE course_code = 'CSC402';

UPDATE portfolio3_lost_update_test
SET available_slots = 9
WHERE course_code = 'CSC402';

COMMIT;

-- Expected final value in this lost-update scenario: 9.


-- PART B: PREVENTION USING ATOMIC UPDATES

UPDATE portfolio3_lost_update_test
SET available_slots = 10
WHERE course_code = 'CSC402';


-- SESSION 1:
BEGIN;

UPDATE portfolio3_lost_update_test
SET available_slots = available_slots - 1
WHERE course_code = 'CSC402';

COMMIT;


-- SESSION 2:
BEGIN;

UPDATE portfolio3_lost_update_test
SET available_slots = available_slots - 1
WHERE course_code = 'CSC402';

COMMIT;

-- Expected final value: 8.


-- FINAL VERIFICATION

SELECT *
FROM portfolio3_lost_update_test
WHERE course_code = 'CSC402';
