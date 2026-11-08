-- =====================================================
-- MIVA MIT PORTFOLIO 3
-- Transaction Testing - Session 2
-- Case Study: Student Management System
-- PostgreSQL 18
-- =====================================================

-- TEST 1: Row-level locking
-- Run this while Session 1 holds the row lock.

BEGIN;

UPDATE portfolio3_locking_test
SET available_slots = available_slots - 1
WHERE course_code = 'CSC401';

-- This UPDATE should wait until Session 1 commits.
-- After it returns UPDATE 1, execute COMMIT below.

COMMIT;

-- TEST 2: Verify course availability

SELECT *
FROM portfolio3_locking_test
WHERE course_code = 'CSC401';


-- TEST 3: Verify atomic update results

SELECT *
FROM portfolio3_lost_update_test
WHERE course_code = 'CSC402';
