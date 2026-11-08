-- =====================================================
-- MIVA MIT PORTFOLIO 3
-- Experiment 3: READ COMMITTED Isolation
-- Case Study: Student Management System
-- PostgreSQL 18
-- =====================================================

-- Create a temporary test table
CREATE TEMP TABLE isolation_test (
    test_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100),
    enrollment_status VARCHAR(30)
) ON COMMIT PRESERVE ROWS;

-- Insert an initial student record
INSERT INTO isolation_test
(student_name, enrollment_status)
VALUES
('Portfolio Isolation Student', 'Pending');

-- Start transaction with READ COMMITTED isolation
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Read the student record
SELECT * FROM isolation_test;

-- End transaction
COMMIT;

-- Verify the final record
SELECT * FROM isolation_test;
