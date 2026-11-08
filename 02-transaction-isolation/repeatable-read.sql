-- =====================================================
-- MIVA MIT PORTFOLIO 3
-- Experiment 4: REPEATABLE READ Isolation
-- Case Study: Student Management System
-- PostgreSQL 18
-- =====================================================

-- IMPORTANT:
-- Execute the following sections in separate sessions.
-- Do not execute the entire file at once.

-- ==========================================
-- PREPARATION (Run before starting sessions)
-- ==========================================

UPDATE portfolio3_isolation_test
SET enrollment_status = 'Pending'
WHERE test_id = 1;

SELECT * FROM portfolio3_isolation_test
WHERE test_id = 1;

-- ==========================================
-- SESSION 1: REPEATABLE READ
-- ==========================================

BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- First read: Expected Pending
SELECT * FROM portfolio3_isolation_test
WHERE test_id = 1;

-- Repeat read after Session 2 commits:
-- Expected Pending again

SELECT * FROM portfolio3_isolation_test
WHERE test_id = 1;

-- End transaction
COMMIT;

-- Fresh read after COMMIT:
-- Expected Approved

SELECT * FROM portfolio3_isolation_test
WHERE test_id = 1;

-- ==========================================
-- SESSION 2: CONCURRENT UPDATE
-- ==========================================

BEGIN;

UPDATE portfolio3_isolation_test
SET enrollment_status = 'Approved'
WHERE test_id = 1;

COMMIT;
