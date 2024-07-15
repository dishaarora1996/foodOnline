#!/bin/bash

# Update package list and install PostgreSQL
sudo apt-get update
sudo apt-get install -y postgresql postgresql-contrib

# Start PostgreSQL service
sudo systemctl start postgresql
sudo systemctl enable postgresql

# Switch to the postgres user and create a new database
sudo -i -u postgres psql -- << EOF
-- Create a new database
CREATE DATABASE foodonline;

-- Optionally, create a new user with a password and grant all privileges on the new database
CREATE USER myuser WITH PASSWORD '1234';
GRANT ALL PRIVILEGES ON DATABASE foodonline TO myuser;

\q
EOF

echo "PostgreSQL installed and database 'foodonline' created successfully."
