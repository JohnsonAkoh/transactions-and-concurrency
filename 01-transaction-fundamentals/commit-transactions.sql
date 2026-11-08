-- =====================================================
-- MIVA MIT PORTFOLIO 3
-- Experiment 1: COMMIT Transaction
-- Case Study: Student Management System
-- PostgreSQL 18
-- =====================================================

-- Remove previous temporary test table if present
DROP TABLE IF EXISTS transaction_commit_test;

-- Start transaction
BEGIN;

-- Create temporary test table
CREATE TEMP TABLE transaction_commit_test (
    test_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    department VARCHAR(100),
    transaction_status VARCHAR(30)
) ON COMMIT PRESERVE ROWS;

-- Insert test records
INSERT INTO transaction_commit_test
(student_name, department, transaction_status)
VALUES
('Portfolio Test Student',
 'Computer Science',
 'Committed'),
('Portfolio Commit Test 002',
 'Computer Science',
 'Committed');

-- Save transaction permanently
COMMIT;

-- Verify committed records
SELECT * FROM transaction_commit_test;
