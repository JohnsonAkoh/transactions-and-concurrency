
-- =====================================================
-- MIVA MIT PORTFOLIO 3
-- TRANSACTIONS AND CONCURRENCY
-- Experiment 1: COMMIT Transaction
-- Case Study: Student Management System
-- Database: PostgreSQL 18
-- =====================================================

-- Start a new transaction
BEGIN;

-- Create a temporary test table for transaction testing
CREATE TEMPORARY TABLE transaction_commit_test (
    test_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    department VARCHAR(100),
    transaction_status VARCHAR(30)
);

-- Insert a test student record
INSERT INTO transaction_commit_test
(student_name, department, transaction_status)
VALUES
('Portfolio Test Student', 'Computer Science', 'Committed');

-- Verify the inserted record before committing
SELECT * FROM transaction_commit_test;

-- Permanently save the transaction
COMMIT;

-- Verify the committed record
SELECT * FROM transaction_commit_test;

