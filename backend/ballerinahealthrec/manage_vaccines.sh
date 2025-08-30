#!/bin/bash

# Vaccine Management Script
# This script helps you manage vaccines in the database

MYSQL_PATH="/Applications/XAMPP/xamppfiles/bin/mysql"
USER_ID="01f081e5-2531-1cd6-bb0c-a64a3d1833cf"

echo "=== Vaccine Management Script ==="
echo "1. View all vaccines for user"
echo "2. Update a vaccine"
echo "3. Delete a vaccine"
echo "4. Add a new custom vaccine"
echo "5. Mark vaccine as completed"
echo "6. Mark vaccine as not completed"
echo "7. Exit"
echo ""

read -p "Choose an option (1-7): " choice

case $choice in
    1)
        echo "Viewing all vaccines for user $USER_ID:"
        $MYSQL_PATH -u root -e "USE babadb; SELECT id, name, dose, due_date, completed_date, is_custom FROM vaccine_records WHERE user_id = '$USER_ID' ORDER BY id;"
        ;;
    2)
        read -p "Enter vaccine ID to update: " vaccine_id
        read -p "Enter new name: " new_name
        read -p "Enter new dose: " new_dose
        $MYSQL_PATH -u root -e "USE babadb; UPDATE vaccine_records SET name = '$new_name', dose = '$new_dose' WHERE id = $vaccine_id;"
        echo "Vaccine updated successfully!"
        ;;
    3)
        read -p "Enter vaccine ID to delete: " vaccine_id
        $MYSQL_PATH -u root -e "USE babadb; DELETE FROM vaccine_records WHERE id = $vaccine_id;"
        echo "Vaccine deleted successfully!"
        ;;
    4)
        read -p "Enter vaccine name: " vaccine_name
        read -p "Enter vaccine dose: " vaccine_dose
        read -p "Enter due date (YYYY-MM-DD): " due_date
        $MYSQL_PATH -u root -e "USE babadb; INSERT INTO vaccine_records (user_id, name, dose, due_date, is_custom, created_at) VALUES ('$USER_ID', '$vaccine_name', '$vaccine_dose', '$due_date', true, NOW());"
        echo "Custom vaccine added successfully!"
        ;;
    5)
        read -p "Enter vaccine ID to mark as completed: " vaccine_id
        $MYSQL_PATH -u root -e "USE babadb; UPDATE vaccine_records SET completed_date = NOW() WHERE id = $vaccine_id;"
        echo "Vaccine marked as completed!"
        ;;
    6)
        read -p "Enter vaccine ID to mark as not completed: " vaccine_id
        $MYSQL_PATH -u root -e "USE babadb; UPDATE vaccine_records SET completed_date = NULL WHERE id = $vaccine_id;"
        echo "Vaccine marked as not completed!"
        ;;
    7)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid option. Please choose 1-7."
        ;;
esac
