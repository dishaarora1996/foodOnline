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
CREATE DATABASE foodOnline;

-- Optionally, create a new user with a password and grant all privileges on the new database
-- CREATE USER myuser WITH PASSWORD 'mypassword';
-- GRANT ALL PRIVILEGES ON DATABASE mydatabase TO myuser;

\q
EOF

echo "PostgreSQL installed and database 'mydatabase' created successfully."
