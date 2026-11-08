-- =====================================================
-- MIVA MIT PORTFOLIO 3
-- Experiment 2: ROLLBACK Transaction
-- Case Study: Student Management System
-- PostgreSQL 18
-- =====================================================

-- Remove previous test table if it exists
DROP TABLE IF EXISTS transaction_rollback_test;

-- Create temporary test table
CREATE TEMP TABLE transaction_rollback_test (
    test_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    department VARCHAR(100),
    transaction_status VARCHAR(30)
) ON COMMIT PRESERVE ROWS;

-- Start transaction
BEGIN;

-- Insert test record
INSERT INTO transaction_rollback_test
(student_name, department, transaction_status)
VALUES
('Portfolio Rollback Student',
 'Computer Science',
 'Pending');

-- Check the inserted record before rollback
SELECT * FROM transaction_rollback_test;

-- Reverse the uncommitted insertion
ROLLBACK;

-- Verify that no inserted records remain
SELECT * FROM transaction_rollback_test;
