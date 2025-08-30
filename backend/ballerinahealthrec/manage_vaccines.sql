 e-- Vaccine Management Script
-- Use this script to manually manage vaccines in the database

-- Connect to the database
USE babadb;

-- View all vaccines for a specific user
-- Replace 'USER_ID_HERE' with the actual user ID
SELECT id, name, dose, due_date, completed_date, is_custom, created_at 
FROM vaccine_records 
WHERE user_id = '01f081e5-2531-1cd6-bb0c-a64a3d1833cf'
ORDER BY id;

-- Update a vaccine (replace ID, name, and dose as needed)
-- UPDATE vaccine_records 
-- SET name = 'New Vaccine Name', dose = 'New Dose' 
-- WHERE id = 26;

-- Delete a vaccine (replace ID as needed)
-- DELETE FROM vaccine_records WHERE id = 26;

-- Add a new custom vaccine
-- INSERT INTO vaccine_records (user_id, name, dose, due_date, is_custom, created_at) 
-- VALUES ('01f081e5-2531-1cd6-bb0c-a64a3d1833cf', 'Custom Vaccine Name', 'Custom Dose', '2025-12-31', true, NOW());

-- Mark a vaccine as completed
-- UPDATE vaccine_records 
-- SET completed_date = NOW() 
-- WHERE id = 26;

-- Mark a vaccine as not completed
-- UPDATE vaccine_records 
-- SET completed_date = NULL 
-- WHERE id = 26;
