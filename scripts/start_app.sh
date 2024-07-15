#!/usr/bin/env bash
set -e

PROJECT_MAIN_DIR_NAME="foodOnline"

# Validate variables
if [ -z "$PROJECT_MAIN_DIR_NAME" ]; then
    echo "Error: PROJECT_MAIN_DIR_NAME is not set. Please set it to your project directory name." >&2
    exit 1
fi

# Change ownership to ubuntu user
sudo chown -R ubuntu:ubuntu "/home/ubuntu/project/$PROJECT_MAIN_DIR_NAME"

# Change directory to the project main directory
cd "/home/ubuntu/project"

# Activate virtual environment
echo "Activating virtual environment..."
source "/home/ubuntu/project/venv/bin/activate"

# Change directory to the project main directory
cd "/home/ubuntu/project/$PROJECT_MAIN_DIR_NAME"

# Run collectstatic command
echo "Running collectstatic command..."
python manage.py collectstatic --noinput

# Restart Gunicorn and Nginx services
echo "Restarting Gunicorn and Nginx services..."
sudo service gunicorn restart
sudo service nginx restart

echo "Application started successfully."