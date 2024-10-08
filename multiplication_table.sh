#!/bin/bash

# Function to print the multiplication table in plain format
print_plain() {
    for (( i=start; i<=end; i++ )); do
        result=$(( number * i ))
        echo "$number x $i = $result"
    done
}

# Function to print the multiplication table in boxed format 
print_boxed() {
    echo "+--------------------+"
    for (( i=start; i<=end; i++ )); do
        result=$(( number * i ))
        printf "| %2d x %-2d = %-4d |\n" "$number" "$i" "$result"
    done
    echo "+--------------------+"
}

# Function to print the multiplication table in dashed format 
print_dashed() {
    for (( i=start; i<=end; i++ )); do
        result=$(( number * i ))
        echo "$number x $i = $result"
        echo "----------------------"
    done
}

# Function to handle table formatting 
choose_format() {
    read -p "Choose the table format: 'plain', 'boxed', or 'dashed': " format
    case "$format" in
        plain)
            print_plain
            ;;
        boxed)
            print_boxed
            ;;
        dashed)
            print_dashed
            ;;
        *)
            echo "Invalid format. Defaulting to plain."
            print_plain
            ;;
    esac
}

# Shell script to perform multiplication table 
multiplication_table() {
    # Prompt the user to enter a number 
    read -p "Enter a number: " number 

    # Check if the input is valid
    if ! [[ "$number" =~ ^[0-9]+$ ]]; then
        echo "Please enter a valid number."  
        exit 1
    fi

    # Request full or partial table 
    read -p "Do you want a full table or a partial table? Enter 'full' or 'partial': " choice

    # Check user choice
    if [[ "$choice" == "full" ]]; then
        start=1
        end=10
    elif [[ "$choice" == "partial" ]]; then
        # Ask the start and end values
        read -p "Enter the start number: " start
        read -p "Enter the end number: " end

        # Validate that both start and end values are valid numbers 
        if ! [[ "$start" =~ ^[0-9]+$ && "$end" =~ ^[0-9]+$ && "$start" -le "$end" ]]; then
            echo "Please enter valid numbers where start is less than or equal to end."
            exit 1
        fi
    else
        echo "Invalid choice. Please enter 'full' or 'partial'."
        exit 1
    fi

    # Ask for the formatting style
    choose_format
}

# Main loop for multiplication table 
while true; do
    # Call the function to print the table
    multiplication_table

    # Ask the user if they want to calculate another table or exit
    read -p "Do you want to calculate another table? (yes/no): " answer

    if [[ "$answer" != "yes" ]]; then
        echo "Goodbye from Gini multiplication table."
        break
    fi
done
