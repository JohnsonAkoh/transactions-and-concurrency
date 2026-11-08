-- =====================================================
-- MIVA MIT PORTFOLIO 3
-- Experiment 5: SERIALIZABLE Isolation
-- Case Study: Student Management System
-- PostgreSQL 18
-- =====================================================

-- PREPARATION
-- Run once before starting the two sessions.

DROP TABLE IF EXISTS portfolio3_serializable_test;

CREATE TABLE portfolio3_serializable_test (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL
);

-- SESSION 1 (Connection A)
-- Start this transaction and leave it open.

BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SELECT COUNT(*) AS current_students
FROM portfolio3_serializable_test;

INSERT INTO portfolio3_serializable_test (student_name)
SELECT 'Serializable Student - Session 1'
WHERE (
    SELECT COUNT(*)
    FROM portfolio3_serializable_test
) < 1;

-- COMMIT SESSION 1
COMMIT;


-- SESSION 2 (Connection B)
-- Start before Session 1 commits.

BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SELECT COUNT(*) AS current_students
FROM portfolio3_serializable_test;

INSERT INTO portfolio3_serializable_test (student_name)
SELECT 'Serializable Student - Session 2'
WHERE (
    SELECT COUNT(*)
    FROM portfolio3_serializable_test
) < 1;

-- COMMIT SESSION 2
-- Expected SQLSTATE 40001 serialization failure.


-- FINAL VERIFICATION
SELECT *
FROM portfolio3_serializable_test
ORDER BY student_id;

SELECT COUNT(*) AS total_students
FROM portfolio3_serializable_test;
