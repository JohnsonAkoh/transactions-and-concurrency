-- =====================================================
-- MIVA MIT PORTFOLIO 3
-- Transaction Testing - Session 1
-- Case Study: Student Management System
-- PostgreSQL 18
-- =====================================================

-- Test 1: Row-level locking

BEGIN;

SELECT *
FROM portfolio3_locking_test
WHERE course_code = 'CSC401'
FOR UPDATE;

-- Keep this transaction open while Session 2
-- attempts to update the same course record.

-- Execute COMMIT only after Session 2 is waiting.

COMMIT;


-- Test 2: Verify course availability

SELECT *
FROM portfolio3_locking_test
WHERE course_code = 'CSC401';


-- Test 3: Verify atomic update results

SELECT *
FROM portfolio3_lost_update_test
WHERE course_code = 'CSC402';
